//
//  SKLoginPageVC.m
//  SKLoginPage
//
//  Created by nachuan on 16/6/21.
//  Copyright © 2016年 SoKon. All rights reserved.
//

#import "SKLoginPageVC.h"
#import "SKTextField.h"
#define kTopViewHeight 170  //topView 的高度
#define kMiddleHeight 198 //middleView 的高度
#define kScreenWidth self.view.frame.size.width //页面宽度
#define kScreenHeight self.view.frame.size.height //页面高度
@interface SKLoginPageVC ()

/** 用户头像 */
@property (nonatomic, strong) UIImageView *avatarIV;

/** 用户昵称 */
@property (nonatomic, strong) SKTextField *usernameTF;

/** 密码 */
@property (nonatomic, strong) SKTextField *passwordTF;

/** 登录按钮 */
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation SKLoginPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_wallpaper"]];
    [self createTopView];
    [self createMiddleImageView];
    [self createthirdView];
}

/** 创建顶部视图 */
- (void)createTopView
{
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, 0, kScreenWidth, kTopViewHeight);
    [self.view addSubview:topView];

    UIButton *cancelBtn = [[UIButton alloc] init];
    cancelBtn.frame = CGRectMake(20, 40, 20, 20);
    [cancelBtn setImage:[UIImage imageNamed:@"login_close"] forState:UIControlStateNormal];
    [cancelBtn setImage:[UIImage imageNamed:@"login_close_highlighted"] forState:UIControlStateHighlighted];
    [cancelBtn addTarget:self action:@selector(cancelBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:cancelBtn];
    
    _avatarIV = [[UIImageView alloc] init];
    _avatarIV.frame = CGRectMake(0, 0, 60, 60);
    _avatarIV.image = [UIImage imageNamed:@"login_picture"];
    _avatarIV.center = CGPointMake(topView.center.x, topView.center.y + 10);
    _avatarIV.layer.cornerRadius = 30;
    _avatarIV.layer.masksToBounds = YES;
    _avatarIV.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarIV.layer.borderWidth = 4;
    [topView addSubview:_avatarIV];
    
}

/** 创建中间部位的视图 */
- (void)createMiddleImageView
{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, kTopViewHeight, kScreenWidth, kMiddleHeight);
    [self.view addSubview:view];
    
    UIImageView *middleIV = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"login_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 50, 0, 50) resizingMode:UIImageResizingModeTile]];
    middleIV.userInteractionEnabled = YES;
    middleIV.frame = CGRectMake(0, 0, kScreenWidth, 99);
    [view addSubview:middleIV];
    
    _usernameTF = [[SKTextField alloc] initWithFrame:CGRectMake(16, 2, kScreenWidth - 26, 44) withLeftViewImageName:@"login_user"];
    _usernameTF.placeholder = @"请输入手机号";
    [middleIV addSubview:_usernameTF];
    [_usernameTF addObserver:self forKeyPath:@"hasInput" options:NSKeyValueObservingOptionNew context:nil];
    
    _passwordTF = [[SKTextField alloc] initWithFrame:CGRectMake(16, 52, kScreenWidth - 26, 44) withLeftViewImageName:@"login_key"];
    _passwordTF.placeholder = @"请输入密码";
    [middleIV addSubview:_passwordTF];
    [_passwordTF addObserver:self forKeyPath:@"hasInput" options:NSKeyValueObservingOptionNew context:nil];
    
    _loginBtn = [[UIButton alloc] init];
    _loginBtn.frame = CGRectMake(20, middleIV.frame.size.height + 20, kScreenWidth - 40, 40);
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _loginBtn.backgroundColor = [UIColor orangeColor];
    _loginBtn.enabled = NO;
    _loginBtn.layer.cornerRadius = 5;
    _loginBtn.layer.masksToBounds = YES;
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_loginBtn];
    
    UIButton *registerBtn = [[UIButton alloc] init];
    registerBtn.frame = CGRectMake(20, middleIV.frame.size.height + 60 + 10, 60, 20);
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [registerBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:registerBtn];
    
    UIButton *forgetPasswordBtn = [[UIButton alloc] init];
    forgetPasswordBtn.frame = CGRectMake(kScreenWidth - 20 - 60, middleIV.frame.size.height + 60 + 10, 60, 20);
    forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    forgetPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPasswordBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:forgetPasswordBtn];
    
}

/** 创建底部视图 */
- (void)createthirdView
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, kTopViewHeight + kMiddleHeight, kScreenWidth, 100);
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 10, kScreenWidth, 20);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    label.text = @"-----其他登录方式-----";
    [view addSubview:label];
    
    for (int i=0; i<3; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = 10 + i;
        btn.frame = CGRectMake(kScreenWidth / 2.0 - 80 + i * 60, 40, 40, 40);
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn setImage:[UIImage imageNamed:@"login_picture"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(thirdLoginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }
    
}



/** 监听textField是否输入内容 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (_usernameTF.hasInput && _passwordTF.hasInput) {
        _loginBtn.enabled = YES;
    }else{
        _loginBtn.enabled = NO;
    }
}

#pragma mark - button点击事件
/** 顶部取消的按 */
- (void)cancelBtnClicked:(UIButton *)sender
{
    NSLog(@"点击了顶部取消的按");
}

/** 登录按钮 */
- (void)loginBtnClicked:(UIButton *)sender
{
    NSLog(@"点击了登录按钮");
}

/** 注册按钮 */
- (void)registerBtnClicked:(UIButton *)sender
{
    NSLog(@"点击了注册按钮");
}

/** 忘记密码按钮 */
- (void)forgetPasswordBtnClicked:(UIButton *)sender
{
    NSLog(@"点击了忘记密码按钮");
}

/** 第三方登录按钮 */
- (void)thirdLoginBtnClicked:(UIButton *)sender
{
    NSLog(@"%@",[NSString stringWithFormat:@"点击了第三方登录按钮%ld",sender.tag]);
}

- (void)dealloc
{
    [_usernameTF removeObserver:self forKeyPath:@"hasInput"];
    [_passwordTF removeObserver:self forKeyPath:@"hasInput"];
}




@end
