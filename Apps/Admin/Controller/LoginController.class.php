<?php
namespace Admin\Controller;
use Think\Controller;
use Common\Model\AdminModel;
class LoginController extends Controller{
     public function index(  ){
                 if( IS_POST ){
                      $admin = D( 'Admin' );
                      if (!$data = $admin->create()) {
                           // 防止输出中文乱码
                           header("Content-type: text/html; charset=utf-8");
                           exit($admin->getError());
                      }
                      $where = array(  );
                      $where[ 'username' ] = $data[ 'username' ];
                      $result = $admin->where( $where )->field( 'userid,username,nickname,password,lastdate,lastip,loginnum')->find(  );

                      // 验证用户名 对比 密码
                      if ($result && $result['password'] == $data['password']) {
                           // 存储session
                           session('uid', $result['userid']);          // 当前用户id
                           session('nickname', $result['nickname']);   // 当前用户昵称
                           session('username', $result['username']);   // 当前用户名
                           session('lastdate', $result['lastdate']);   // 上一次登录时间
                           session('lastip', $result['lastip']);       // 上一次登录ip
                           session('loginnum', $result['loginnum']);       // 上一次登录ip
                           // 更新用户登录信息
                           $where['userid'] = session('uid');
                           $data[ 'lastdate' ] = time(  );
                           M('Admin')->where($where)->setInc('loginnum');   // 登录次数加 1
                           M('Admin')->where($where)->save($data);   // 更新登录时间和登录ip
                           $this->success('登录成功,正跳转至系统首页...', U('Manager/index'));
                           exit(  );
                      } else {
                           $this->error('登录失败,用户名或密码不正确!');
                      }
                 }
                 $this->display(  );
            }

     /**
      * 验证码
      */
     public function verify()
                 {
                      // 实例化Verify对象
                      $verify = new \Think\Verify();
                      // 配置验证码参数
                      $verify->fontSize = 14;     // 验证码字体大小
                      $verify->length = 4;        // 验证码位数
                      $verify->imageH = 34;       // 验证码高度
                      $verify->useImgBg = true;   // 开启验证码背景
                      $verify->useNoise = false;  // 关闭验证码干扰杂点
                      $verify->entry();
                 }
     /**
      * @description:login out
      */
     public function logout(  ){
                 session( null );
                 $this->success( '退出成功！欢迎下次光临',U( 'Login/index' ),5 );
                 exit(  );
            }
}