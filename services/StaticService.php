<?php
namespace app\services;

use Yii;
class StaticService {
    /*
     *  统一加载js或者css
     */ 
    public static function includeAppStatic($type,$path,$depend){
      //静态方法 版本号是为了解决缓存的问题
        $release_version=defined("RELEASE_VERSION")? RELEASE_VERSION :"201507240011";
       if(stripos($path,"?")!==false){
           $path=$path."&version={$release_version}";
       }else{
           $path=$path."?version={$release_version}";
       }
       //加载css或js
       if($type=="css"){
           Yii::$app->getView()->registerCssFile($path,['depends'=>$depend]);
       }else{
           Yii::$app->getView()->registerJsFile($path,['depends'=>$depend]);
           
       }
       
    }
    //调用js静态资源
    public static function includeAppJsStatic($path,$depend){
          self::includeAppStatic("js", $path, $depend);
    }
    //调用css静态资源
    public static function includeAppCssStatic($path,$depend){
        self::includeAppStatic("css", $path, $depend);
    }
    
}

