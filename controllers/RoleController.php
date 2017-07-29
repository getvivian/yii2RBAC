<?php
namespace app\controllers;

use app\models\Role;
use app\models\Access;
use app\models\RoleAccess;
use app\services\UrlService;
use app\controllers\common\BaseController;
class RoleController extends BaseController{
    
    //角色列表
    public function actionIndex(){
        //查询所有的角色
        $list=Role::find()->orderBy(['id'=>SORT_DESC])->all();
        return $this->render("index",[
          'list'=>$list  
        ]);
    }
    /*角色添加或者修改
     * get 展示列表
     * post 处理添加或者修改
     */
    public function actionSet(){
        //get请求
        if(\Yii::$app->request->isGet){
            $id=$this->get("id",0);
            $info=[];
            if($id){
             $info=Role::find()->where(['id'=>$id])->one();
            }
            return $this->render("set",[
              'info'=>$info
            ]);
        }
        $id=$this->post('id',0);
        $name=$this->post("name","");
        $date_time=date("Y-m-d H:i:s");
        if(!$name){
           return $this->renderJSON([],"请输入合法的角色名称~~~",-1);
        }
        //查询是否存在相等的记录
        $role_info=Role::find()
         ->where(['name'=>$name])->andWhere(['!=','id',$id])
         ->one();
        if($role_info){
           return $this->renderJSON([],"角色已存在，请输入其他角色~~~",-1);    
        }
        $info=Role::find()->where(['id'=>$id])->one();
        
        if($info){//编辑动作
         $role_model=$info;
         }else{//添加动作
         $role_model= new Role(); 
         $role_model->created_time=$date_time;   
        } 
        $role_model->name=$name; 
        $role_model->updated_time=$date_time;
        $role_model->save(0);
        return $this->renderJSON([],"操作成功~~",200);
    }
    //设置角色和权限的逻辑关系
    public function actionAccess(){
      //http get请求
         if(\Yii::$app->request->isGet){
          $id=$this->get('id',0);
          $reback_url= UrlService::buildUrl("/role/index");
          if(!$id){
              return $this->redirect($reback_url);
          }
          //查询id所在的这条权限信息
          $info=Role::find()->where(['id'=>$id])->one();
          if(!$info){
              return $this->redirect($reback_url);
          }
          //取出所有的权限
       $access_list=Access::find()->where(['status'=>1])->orderBy(['id'=>SORT_DESC])->all();
         //取出已经分配的权限;
       $role_access_list=RoleAccess::find()->where(['role_id'=>$id])->asArray()->all();
        //将access_id通过array_column()函数重新排列成单数组 
       $access_ids=array_column($role_access_list,'access_id');
       
       return $this->render("access",[
        'info'=>$info, 
        'access_list'=>$access_list,
        'access_ids'=>$access_ids
       ]);
       
      }
      //实现保存选中的权限的实现逻辑
      $id=$this->post('id',0);//隐藏域随表单传来的id
      $access_ids=$this->post('access_ids',[]);//提交过来的access_ids数组
      if(!$id){
         return $this->renderJSON([],'您指定的角色不存在',-1);
      }
      $info=Role::find()->where(['id'=>$id])->one();
      if(!$info){
         return $this->renderJSON([],"您指定的角色不存在",-1);
      }
      
      //取出已经分配好的权限
     $role_access_list=RoleAccess::find()->where(['role_id'=>$id])->asArray()->all();
     $assign_access_ids= array_column($role_access_list,'access_id');//已分配的权限
      //补集的tags
      /* 1.找出删除的权限
       * 2.假如已有的权限是A 表单传过来的权限是B
       * 3.权限集合A中有的权限，不在集合B中，就应该删除集合A与B的差集
       * 4.使用array_diff()来计算差集 
       */
      $delete_access_ids=array_diff($assign_access_ids,$access_ids);
      if($delete_access_ids){
          RoleAccess::deleteAll(['role_id'=>$id,'access_id'=>$delete_access_ids]);
      }
       /* 1.找出添加的权限
       * 2.假如已有的权限是A 表单传过来的权限是B
       * 3.权限集合B中的权限，不在集合A中，就应该添加
       * 4.使用array_diff()来计算差集
       */
      $new_access_ids=array_diff($access_ids,$assign_access_ids);
      //这个是添加权限的时候传过来的$access_ids,跟现在已有的权限$assign_access_ids进行对比，没有的权限就是想添加的权限
      if($new_access_ids){
          foreach($new_access_ids as $_access_id){
            //添加的权限是单数组
              $tmp_model_role_access=new RoleAccess();
              $tmp_model_role_access->role_id=$id;
              $tmp_model_role_access->access_id=$_access_id;
              $tmp_model_role_access->created_time=date("Y-m-d H:i:s");
              $tmp_model_role_access->save(0);
          }
      }
      
       return $this->renderJSON([],"添加成功~~~",200);
      
    }
    
    
}


