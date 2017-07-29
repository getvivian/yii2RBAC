<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;
use app\services\UrlService;
/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
 /*   public $css = [
        'css/site.css',
    ];
    public $js = [
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
  * 
  */
   public function registerAssetFiles($view) {
       $release="20161213";
     $this->css=[
         UrlService::buildUrl("/bootstrap/css/bootstrap.min.css",['v'=>$release]),
         UrlService::buildUrl("/css/app.css"),
         UrlService::buildUrl("/css/site.css"),
     ];
     $this->js=[
     
      UrlService::buildUrl("/bootstrap/js/bootstrap.min.js"),
      UrlService::buildUrl( "/jquery/jquery.min.js" )    
     ];
     //print_r($this->js);exit;
     parent::registerAssetFiles($view);
   } 
    
}
