//
//  LoginViewController.m
//  BYLearn
//
//  Created by xy_yanfa_imac on 2018/5/22.
//  Copyright © 2018年 xy_yanfa_imac. All rights reserved.
//

#import "LoginViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"hello world"];
        return nil;
    }];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
