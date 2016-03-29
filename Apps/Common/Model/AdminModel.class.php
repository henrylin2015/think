<?php
namespace Common\Model;
use Think\Model;

class AdminModel extends Model{
     public $_validate = array(
           array('username', 'require', '用户名不能为空！'), //默认情况下用正则进行验证
           array( 'passwod','require','密码不能为空！' )
          );
}
