<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
                echo C( 'URL_MODEL' )."<BR>";
                echo "home/index";
    }
}