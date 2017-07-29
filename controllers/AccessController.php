<?php
namespace app\controllers;

use app\controllers\common\BaseController;
use app\models\Access;

class AccessController extends BaseController{
   
    public function actionIndex(){
      //查询所有的权限列表
     $access_list=Access::find()->where(['status'=>1])->orderBy(['id'=>SORT_DESC])->all(); 
     return $this->render('index',[
      "list"=>$access_list
     ]);   
        
    }
    /**** 权限添加或者修改
     * get/展示页面
     * post/处理数据
     * 
     **/
    public function actionSet(){
        //get
       if(\Yii::$app->request->isGet){
        $id=$this->get('id',0); 
        $info=[];
        if($id){
           $info=Access::find()->where(['status'=>1,'id'=>$id])->one();
        }
        return $this->render("set",[
         "info"=>$info   
        ]);
           
       }
       //post
       $id= intval($this->post("id",0));
       $title=trim($this->post("title",""));
       $urls=trim($this->post("urls",""));
       $data_now=date("Y-m-d H:i:s");
       if(mb_strlen($title,"utf-8")<1||mb_strlen($title,"utf-8")>20){
           return $this->renderJSON([],"请输入合法的权限标题~~~",-1);
       }
       if(!$urls){
           return $this->renderJSON([],"请输入合法的urls",-1);
       }
       //数组转字符串
       $urls=explode("\n",$urls);
       if(!$urls){
           return $this->renderJSON([],"请输入合法的urls",-1);
       }
       //查询权限标题是否存在
       $has_in=Access::find()->where(['title'=>$title])->andWhere(['!=','id',$id])->count();
       if($has_in){
           return $this->renderJSON([],"权限标题已经存在,请输入其他标题",-1);
       }
      //查询指定的id的数据
       $info=Access::find()->where(['id'=>$id])->one();
       if($info){//存在即编辑
        $access_model=$info;   
       }else{//不存在则添加
        $access_model=new Access();
        $access_model->status=1;
        $access_model->created_time=$data_now;  
       }
       $access_model->title=$title;
       $access_model->urls=json_encode($urls);//json格式保存
       $access_model->updated_time=$data_now;
       $access_model->save(0);
       return $this->renderJSON([],"添加成功~~~"); 
    }
    
    
    
    
}


