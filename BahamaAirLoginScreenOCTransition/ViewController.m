//
//  ViewController.m
//  BahamaAirLoginScreenOC
//
//  Created by qinglinyou on 2018/3/1.
//  Copyright © 2018年 qinglinyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *heading;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIImageView *cloud2;
@property (weak, nonatomic) IBOutlet UIImageView *cloud3;
@property (weak, nonatomic) IBOutlet UIImageView *cloud4;
//第二章
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
//第三章
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic) NSArray *messages;
@property (assign, nonatomic) CGPoint statusPosition;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _cloud1.alpha = _cloud2.alpha = _cloud3.alpha = _cloud4.alpha = 0.0;
    
    
    
    [self.loginButton addSubview:self.spinner];
    
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.image = [UIImage imageNamed:@"banner"];
    [self.imageView sizeToFit];
    self.imageView.center = self.loginButton.center;
    self.imageView.hidden = YES;
    [self.view addSubview:self.imageView];
    
    self.messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height)];
    self.messageLabel.font = [UIFont systemFontOfSize:18.0];
    [self.messageLabel setTextColor:[UIColor colorWithRed:0.89 green:0.38 blue:0.0 alpha:1.0]];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    [self.imageView addSubview:self.messageLabel];
    
    self.statusPosition = CGRectZero.origin;
    
    self.statusPosition = self.imageView.center;
    
    
    self.messages = @[@"Connecting ...",@"Authorizing ...",@"Sending credentials ...",@"Failed"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _heading.center = CGPointMake(_heading.center.x-self.view.frame.size.width, _heading.center.y);
    _userName.center = CGPointMake(_userName.center.x-self.view.frame.size.width, _userName.center.y);
    _password.center = CGPointMake(_password.center.x-self.view.frame.size.width, _password.center.y);
    
    //////////////////////////////////////////////第一章
//    self.loginButton.center = CGPointMake(self.loginButton.center.x, self.loginButton.center.y + 30.0);
//    self.loginButton.alpha = 0.0;

   
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:nil animations:^{
        _cloud1.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:nil animations:^{
        _cloud2.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:nil animations:^{
        _cloud3.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:nil animations:^{
        _cloud4.alpha = 1.0;
    } completion:nil];
//////////////////////////////////////////////第二章  challenge
    [self animationCloud:_cloud1];
    [self animationCloud:_cloud2];
    [self animationCloud:_cloud3];
    [self animationCloud:_cloud4];
    
//////////////////////////////////////////////  动画初识
    [UIView animateWithDuration:0.5 animations:^{
        _heading.center = CGPointMake(_heading.center.x+self.view.frame.size.width, _heading.center.y);
    }];
    
    [UIView animateWithDuration:0.5 delay:0.3 options:nil animations:^{
        _userName.center = CGPointMake(_userName.center.x+self.view.frame.size.width, _userName.center.y);
    } completion:nil];
    [UIView animateWithDuration:0.5 delay:0.4 options:nil animations:^{
        _password.center = CGPointMake(_password.center.x+self.view.frame.size.width, _password.center.y);
    } completion:nil];
    
    //    密码控件反复
    //    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionRepeat animations:^{
    //        _password.center = CGPointMake(_password.center.x+self.view.frame.size.width, _password.center.y);
    //    } completion:nil];
    //    密码控件往返循环
    //    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
    //        _password.center = CGPointMake(_password.center.x+self.view.frame.size.width, _password.center.y);
    //    } completion:nil];
    //    密码控件往返循环 减速结束
    //    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseOut animations:^{
    //        _password.center = CGPointMake(_password.center.x+self.view.frame.size.width, _password.center.y);
    //    } completion:nil];
    //    密码控件往返循环 加速开始
    //    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseIn animations:^{
    //        _password.center = CGPointMake(_password.center.x+self.view.frame.size.width, _password.center.y);
    //    } completion:nil];
    //    密码控件往返循环 加速开始  减速结束
    //    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseInOut animations:^{
    //        _password.center = CGPointMake(_password.center.x+self.view.frame.size.width, _password.center.y);
    //    } completion:nil];
    
    //////////////////////////////////////////////第一章
    //    [UIView animateWithDuration:5 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:10.0 options:nil animations:^{
    //        self.loginButton.center = CGPointMake(self.loginButton.center.x, self.loginButton.center.y - 30.0);
    //        self.loginButton.alpha = 1.0;
    //    } completion:nil];

}
//////////////////////////////////////////////第二章
- (IBAction)loginOnClick:(id)sender {
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:nil animations:^{
        self.loginButton.bounds = CGRectMake(self.loginButton.bounds.origin.x, self.loginButton.bounds.origin.y, self.loginButton.bounds.size.width + 80.0, self.loginButton.bounds.size.height);
    } completion:^(BOOL finished){
        [self showMessage:0];
    }];
    
    [UIView animateWithDuration:0.33 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.0 options:nil animations:^{
        self.loginButton.center = CGPointMake(self.loginButton.center.x, self.loginButton.center.y + 60.0);
//        活动指示器
        self.spinner.center = CGPointMake(40, self.loginButton.frame.size.height/2);
        self.spinner.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        self.loginButton.backgroundColor = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1.0];
    }];

}

//////////////////////////////////////////////第三章
- (void)showMessage:(NSInteger)index{
    self.messageLabel.text = self.messages[index];
    [UIView transitionWithView:self.imageView duration:0.33 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionTransitionCurlDown animations:^{
        self.imageView.hidden = NO;
    } completion:^(BOOL finished) {
        //transition completion
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (index<self.messages.count - 1) {
                [self removeMessage:index];
            }else{
                //reset form
                [self resetForm];
            }
        });
    }];
}

- (void)removeMessage:(NSInteger)index{
    [UIView animateWithDuration:0.33 delay:0.0 options:nil animations:^{
        self.imageView.center = CGPointMake(self.imageView.center.x + self.view.frame.size.width, self.imageView.center.y);
    } completion:^(BOOL finished) {
        self.imageView.hidden = YES;
        self.imageView.center = self.statusPosition;
        
        [self showMessage:(index + 1)];
    }];
}

- (void)resetForm{
    [UIView transitionWithView:self.imageView duration:0.22 options:UIViewAnimationTransitionCurlUp animations:^{
        self.imageView.hidden = YES;
        self.imageView.center = self.statusPosition;
    } completion:nil];
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationTransitionCurlUp animations:^{
        //        a
        self.spinner.center = CGPointMake(20, self.loginButton.frame.size.height/2);
        //        b
        self.spinner.alpha = 0.0;
        //        c
        self.loginButton.backgroundColor = [UIColor colorWithRed:160/255.0 green:214/255.0 blue:94/255.0 alpha:1.0];
        //        d
        self.loginButton.bounds = CGRectMake(self.loginButton.bounds.origin.x, self.loginButton.bounds.origin.y, self.loginButton.bounds.size.width - 80.0, self.loginButton.bounds.size.height);
        //        e
        self.loginButton.center = CGPointMake(self.loginButton.center.x, self.loginButton.center.y - 60);
    } completion:nil];
}

- (void)animationCloud:(UIImageView *)cloud{
    CGFloat couldSpeed = 60 / self.view.bounds.size.width;
    NSTimeInterval cloudTime = (self.view.bounds.size.width - cloud.frame.origin.x) * couldSpeed;
    
    [UIView animateWithDuration:cloudTime delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        cloud.frame = CGRectMake(self.view.bounds.size.width, cloud.frame.origin.y, cloud.frame.size.width, cloud.frame.size.height);
    } completion:^(BOOL finished) {
        cloud.frame = CGRectMake(-cloud.bounds.size.width, cloud.frame.origin.y, cloud.frame.size.width, cloud.frame.size.height);
        [self animationCloud:cloud];
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
