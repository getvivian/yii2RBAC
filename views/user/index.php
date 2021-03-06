<?php
use \app\services\DataHelper;
use \app\services\UrlService;
?>
<div class="row">
    <div class="col-xs-9 col-sm-9 col-md-9  col-lg-9">
        <h5>用户列表</h5>
    </div>
    
    <div class="col-xs-3 col-sm-3 col-md-3  col-lg-3">
        <a href="<?=UrlService::buildUrl("/user/set");?>" class="btn btn-link pull-right">添加用户</a>
    </div>

</div>
<hr/>
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>姓名</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
	    <?php if( $list ):?>
            <?php foreach( $list as $_key => $_user_info ):?>
            <tr>
                <td><?=$_user_info['name'];?></td>
                <td><?=$_user_info['email'];?></td>
                <td>
		
                    <a href="<?=UrlService::buildUrl("/user/set",[ 'id' => $_user_info['id'] ]);?>">编辑</a>
                    <a href="<?=UrlService::buildUrl("/user/del",['id'=>$_user_info['id'],'is_admin'=>$_user_info['is_admin']])?>"onclick="return confirmAct();" >删除</a>
                    
                </td>
            </tr>
            <?php endforeach;?>
        <?php else:?>
            <tr> <td colspan="3">暂无用户</td> </tr>
        <?php endif;?>
        </tbody>
    </table>
</div>
<script type="text/javascript">
 function confirmAct() 
{ 
  if(confirm('确定删除?')) 
  { 
    return true; 
  } 
  return false; 
} 
</script>