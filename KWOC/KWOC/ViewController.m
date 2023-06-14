//
//  ViewController.m
//  KWOC
//
//  Created by 渴望 on 2023/6/14.
//

#import "ViewController.h"

#import <KWOC-Swift.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = UIColor.blackColor;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)btnClick{
    
    NSArray * vcArr = @[[ViewController new],[ViewController new],[ViewController new],[ViewController new],[ViewController new]];
    NSArray * titleArr = @[@"tab1", @"tab2", @"tab3", @"tab4", @"tab5"];
    NSArray * normalImageArr = @[@"icon_guanli01", @"icon_gongzuotai01", @"icon_xiaoxi01", @"icon_wode01", @"icon_wode01"];
    NSArray * selectedImageArr = @[@"icon_fabu", @"icon_gongzuotai02", @"icon_fabu", @"icon_wode02", @"icon_fabu"];
    
    KWTabBarController * vc = [[KWTabBarController alloc]init:vcArr :titleArr :normalImageArr :selectedImageArr humpType:2 humpAddress:@[@0,@2,@4] backGroundColor:[UIColor yellowColor]];
    vc.selectedIndex = 2;
    
    [UIApplication sharedApplication].windows.firstObject.rootViewController = vc;
    [[UIApplication sharedApplication].windows.firstObject makeKeyAndVisible];
}


@end
