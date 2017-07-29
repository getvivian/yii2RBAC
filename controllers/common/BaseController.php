<?php
namespace app\controllers\common;
use Yii;
use app\models\User;
use app\models\Access;
use app\models\UserRole;
use app\services\UrlService;
use app\models\RoleAccess;
use app\models\AppAccessLog;
use yii\web\Controller;
class BaseController extends Controller{
    //公共的控制器 主要是用来存放公共方法的
    protected $auth_cookie_name = "imxushuwen_888";//超级管理员
    protected $current_user=null;//当前登录人信息
    protected $allowAllAction = [
         'user/login',
	 'user/vlogin'
	];
    public $ignore_url=[
        'error/forbidden',
        'user/login',
	'user/vlogin',
        
    ];
    //当前系统需要统一登陆才能使用
    public $privilege_urls=[];
    public function beforeAction($action) {
     $login_status=$this->checkLoginStatus();   
     if(!$login_status && !in_array($action->uniqueId,$this->allowAllAction)){
         if(Yii::$app->request->isAjax){
             $this->renderJSON([],"未登录，请返回登陆中心",-302);
         }else{
             $this->redirect(UrlService::buildUrl("/user/login")); 
         }
         return false;
     }
     //保存所有的访问记录到数据库中
     $get_params=$this->get(null);
     $post_params=$this->post(null);
     $model_log= new AppAccessLog();
     $model_log->uid=$this->current_user?$this->current_user['id']:0;
     $model_log->target_url=isset($_SERVER['REQUEST_URI'])?$_SERVER['REQUEST_URI']:'';
     $model_log->query_params=json_encode(array_merge($post_params,$get_params));
     $model_log->ua=isset($_SERVER['HTTP_USER_AGENT'])?$_SERVER['HTTP_USER_AGENT']:'';
     $model_log->ip=isset($_SERVER['REMOTE_ADDR'])?$_SERVER['REMOTE_ADDR']:'';
     $model_log->created_time=date("Y-m-d H:i:s");
     $model_log->save(0);

     //判断当前访问的权限是否在所拥有的权限中
       if( !$this->checkPrivilege( $action->getUniqueId() ) ){
          $this->redirect(UrlService::buildUrl("/error/forbidden"));
          return false;
        } 
     return true;
    }
    //检查权限是否可访问 function checkprivile 
    public function checkPrivilege($url){
      //是否是超级管理员,如果是超管，也不需要权限限制
      if($this->current_user && $this->current_user["is_admin"]){
          return true;
      }
      //有一些页面不经过权限分配就可以访问到。
      if(in_array($url,$this->ignore_url)){
          return true;
      }
      return in_array( $url, $this->getRolePrivilege() );
    }
    /* 取出某个用户所有的权限
     * 取出指定用户所属的角色
     * 再通过角色，取出角色所分配的权限关系 
     * 在权限表中取出所有的权限链接
     * 
     */
    public function getRolePrivilege($uid = 0){
      if(!$uid && $this->current_user ){
          $uid=$this->current_user->id;  
       }
      if(!$this->privilege_urls){
      //取出指定用户所属的角色的role_id
      $role_ids=UserRole::find()->where(['uid'=>$uid])->select('role_id')->asArray()->column();
      if($role_ids){
          //通过role_ids取出所有的权限access_id
          $access_ids=RoleAccess::find()->where(['role_id'=>$role_ids])->select('access_id')->asArray()->column();
           //通过access_ids取出Access中所有的权限链接
           $list=Access::find()->where(['id'=>$access_ids])->all();
           if($list){
             foreach($list as $_item){
               $tmp_urls=@json_decode($_item['urls'],true);
               //将item中的urls转换成数组形式
               $this->privilege_urls=array_merge($this->privilege_urls,$tmp_urls);
               //合并成一个数组 
              }
           } 
        }
     }
        return $this->privilege_urls;
  }
    
    //验证登陆是否有效 返回true或者false  
    protected function checkLoginStatus(){
    $request=Yii::$app->request;
    $cookies=$request->cookies; 
    $auth_cookie=$cookies->get($this->auth_cookie_name);   
    if(!$auth_cookie){
        return false;
    }   
    list($auth_token,$uid)=explode("#",$auth_cookie);    
    
    if(!$auth_token ||!$uid){
        return false;
    } 
    //验证uid并从数据库中取值
    if($uid && preg_match("/^\d+$/",$uid)){
       $userinfo=User::findOne(['id'=>$uid]);
       if(!$userinfo){
           return false;
       }
       if($auth_token !=$this->createAuthToken($userinfo['id'],$userinfo['name'],$userinfo['email'],$_SERVER['HTTP_USER_AGENT'])){
           return false;
       }
       $this->current_user=$userinfo;//要登陆的赋值给用户
       $view=Yii::$app->view;
       $view->params['current_user']=$userinfo;
       return true; 
     }
      return false;
    }
    //设置Cookie状态
    public function createLoginStatus($userinfo){
      $auth_token=$this->createAuthToken($userinfo['id'], $userinfo['name'], $userinfo['email'],$_SERVER['HTTP_USER_AGENT']);
      $cookies=Yii::$app->response->cookies;
      $cookies->add(new \yii\web\Cookie([
        "name"=>$this->auth_cookie_name,
         "value"=>$auth_token."#".$userinfo['id'],
      ]));
        
    }
    //加密函数
    public function createAuthToken($uid,$name,$email,$user_agent){
      return md5($uid.$name.$email.$user_agent);
    }
    
    
    //统一获得get参数的传值
    public function get($key,$default=""){
       return Yii::$app->request->get($key,$default);  
    }
    //统一获得post参数的传值
    public function post($key,$default=""){
        
      return Yii::$app->request->post($key,$default);
    }
   /*
    *  封装json返回值，主要用于js  ajax 和 后端交互返回格式*
    * data:数据区 数组
    * msg: 此次操作简单提示信息
    * code: 状态码 200 表示成功，http 请求成功 状态码也是200
    */
    protected function renderJSON($data=[],$msg="ok",$code=200){
        header("Content-type:application/json");//设置头部内容格式：主要用来传值http
        echo json_encode([
        'code'=>$code, 
        'data'=>$data,
        'msg'=>$msg,
        'req_id'=> uniqid(),//微秒计的生成一个id(一般置于函数的最后)
        ]);
       return Yii::$app->end();//终止请求，直接返回 
    }
    
    
    
    
}
