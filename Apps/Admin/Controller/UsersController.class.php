<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;

class UsersController extends CommonController{
     public function showlist(  ){
                 $admins = M( 'Admin' )->select(  );
                 $this->assign( 'models',$admins );
                 $this->display(  );
            }
     public function create(  ){
                 if( IS_POST ){
                      $admin = D( 'Admin' );
                      if( !$data = $admin->create(  ) ){
                           header("Content-type: text/html; charset=utf-8");
                           exit($admin->getError());
                      }
                      $data[ 'pid' ] = 0;
                      $data[ 'regdate' ] = time(  );
                      $data[ 'lastdate' ] = time(  );
                      if( $admin->add( $data ) ){
                           $this->success( '数据添加成功！',U( 'users/showlist',5 ) );
                           exit(  );
                      }
                 }
                 $this->display(  );
            }
}