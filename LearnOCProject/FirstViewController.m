//
//  FirstViewController.m
//  LearnOCProject
//
//  Created by Felix on 08/12/2016.
//  Copyright © 2016 Felix. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"首页"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    //自定义导航栏的按钮
    UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonItem setFrame:CGRectMake(0, 0, 40, 30)];
    [buttonItem setTitle:@"Item" forState:UIControlStateNormal];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:buttonItem];
    [buttonItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //self.navigationItem.leftBarButtonItem = item1;
    self.navigationItem.leftBarButtonItems = @[item1,item2];//添加多个导航栏按钮
    //设置导航栏的颜色,默认存在毛玻璃效果
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    //设置导航栏的背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 100, 60, 30)];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    //按钮添加事件
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(NextView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) NextView{
    
    [self.navigationController pushViewController:[[SecondViewController alloc]init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
