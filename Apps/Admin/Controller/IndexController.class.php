<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;
class IndexController extends CommonController {
    public function index(){
                echo session( 'username' );
                echo C( 'URL_MODEL' );
    }
    public function test(  ){
                echo "test";
           }
}