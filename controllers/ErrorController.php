<?php
namespace app\controllers;
use Yii;
use app\controllers\common\BaseController;
use app\services\UrlService;
class ErrorController extends BaseController{
    
    public function actionForbidden(){
        //错误提示
        return $this->render("forbidden");
    }
    
    
}