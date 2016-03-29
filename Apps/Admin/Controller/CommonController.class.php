<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller{
     public function __construct(){
                 parent::__construct();
                 $this->filterLogin(  );
            }
     /**
      * login check 
      */
     protected function filterLogin(  ){
                    if(!session( 'uid' )   && !session( 'username' )){
                         $this->error( '您没有登录过系统！请登录',U( 'Login/index' ),5 );
                    }
               }
}