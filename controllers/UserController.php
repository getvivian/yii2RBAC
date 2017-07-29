<?php
namespace app\controllers;
use Yii;
use app\controllers\common\BaseController;
use app\services\UrlService;
use app\models\User;
use app\models\Role;
use app\models\UserRole;

class UserController extends BaseController{
         //用户列表
        public function actionIndex(){
         //查询所有的用户
         $user_list=User::find()->where(['status'=>1])->orderBy(['id'=>SORT_DESC])->all();
          return $this->render('index',[
           'list'=>$user_list
          ]);  
            
        }
        /*set方法：用户添加或编辑
         * 
         *get传值用来展示页面
         * post 传值用来添加或编辑
         * ****/
        public function actionSet(){
         //get传值
          if(\Yii::$app->request->isGet){
              $id=$this->get("id",0);
              $info=[];
              if($id){
                $info=User::find()->where(['id'=>$id,'status'=>1])->one(); 
              }
              $role_list=Role::find()->orderBy(['id'=>SORT_DESC])->all();
              //取出所有的已分配角色
              $user_role_list=UserRole::find()->where(['uid'=>$id])->asArray()->all();
              $related_role_ids=array_column($user_role_list,'role_id');
              
              return $this->render('set',[
               'info'=>$info,
               'role_list'=>$role_list,
               'related_role_ids'=>$related_role_ids
                     
              ]);   
          }
          //post处理添加和编辑....
          $id=intval($this->post('id',0));
          $name=trim($this->post('name',''));
          $email=trim($this->post('email',''));
          $role_ids=$this->post('role_ids',[]);//选中的权限id:由前端js传过来
          $date_now=date("Y-m-d H:i:s");
          if(mb_strlen($name,'utf-8')<1 || mb_strlen($name,'utf-8')>20){
               return $this->renderJSON([],"请输入正确的用户名~~~",-1);
           }
          
          //邮箱验证
          if( !filter_var($email,FILTER_VALIDATE_EMAIL)){
              return $this->renderJSON([],"请输入正确的邮箱~~~",-1);
          }
          $has_in=User::find()->where(['email'=>$email])->andWhere(['!=','id',$id])->count();
          if($has_in){
              return $this->renderJSON([],"邮箱或名字已存在~~~",-1);
          }
          
          $info=User::find()->where(['id'=>$id])->one();
          if($info){//存在$info 就是编辑
            $model_user=$info;
          }else{//不存在就是添加动作
            $model_user=new User();
            $model_user->status=1;
            $model_user->created_time=$date_now;   
          }
           $model_user->name=$name;
           $model_user->email=$email;
           $model_user->updated_time= $date_now; 
         if($model_user->save(0)){//第一种方法：如果用户信息保存下来，接下来就保存用户和角色的关系
           /****
            * 找出要删除的角色
            * 假如集合A是已存在的集合，界面传过来的集合为B
            * 角色集合A中某个角色 不在角色集合B中，则就应该删除某个角色 
            */
             $user_role_list=UserRole::find()->where(['uid'=>$model_user->id])->all();
             //取出所有
             $related_role_ids=[];//集合A
             if($user_role_list){
                   foreach($user_role_list as $_item){
                     $related_role_ids[]=$_item['id'];
                     if(!in_array($_item['id'],$role_ids)){
                        $_item->delete(0);  
                    }      
                }
             }
             /****
            * 找出要添加的角色
            * 假如集合A是已存在的集合，界面传过来的集合为B
            * 角色集合B中某个角色 不在角色集合A中，则就应该添加某个角色 
            */
            if($role_ids){
                foreach($role_ids as $_role_id){
                 if(!in_array($_role_id,$related_role_ids)){
                 $model_user_role=new UserRole();  
                 $model_user_role->uid=$model_user->id;
                 $model_user_role->role_id=$_role_id;
                 $model_user_role->created_time=$date_now;
                 $model_user_role->save(0); 
                  }   

                } 
                 
             } 
              
          } 
           return $this->renderJSON([],'操作完成~~~',200);
        }
        //删除当前用户的方法
        public function actionDel(){
         if(\Yii::$app->request->isGet){
            $id=$this->get('id',0);
            $isAdmin=$this->get('is_admin',0);
            //判断是否是管理员
            $reback_url=UrlService::buildUrl("/user/index");
            if($id){
             // 执行删除操作
             $del=User::findOne($id)->delete();
             if(!$del){
                return $this->redirect($reback_url);           
              }
             return $this->redirect($reback_url);
            }
           }  
        }
        
        //登陆页面
        public function actionLogin(){
         return $this->render("login");
        }

	//伪登录业务方法,所以伪登录功能也是需要有auth_token
	public function actionVlogin(){
		$uid = $this->get("uid",0);
		$reback_url = UrlService::buildUrl("/");
		if( !$uid ){
			return $this->redirect( $reback_url );
		}
		$user_info = User::find()->where([ 'id' => $uid ])->one();
		if( !$user_info ){
			return $this->redirect( $reback_url );
		}
		//cookie保存用户的登录态,所以cookie值需要加密，规则：user_auth_token + "#" + uid
	     $this->createLoginStatus( $user_info );
	     return $this->redirect( $reback_url );
	}

}
