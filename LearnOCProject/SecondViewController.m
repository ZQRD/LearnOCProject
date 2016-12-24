//
//  SecondViewController.m
//  LearnOCProject
//
//  Created by Felix on 08/12/2016.
//  Copyright © 2016 Felix. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UINavigationBar *navigationBar;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self setTitle:@"Second"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置返回按钮的样式
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:@"POP" style:UIBarButtonItemStylePlain target:self action:@selector(popController)];
    self.navigationItem.leftBarButtonItem = buttonItem;
    // Do any additional setup after loading the view.
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden: YES];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self initTaleView];
    [self initNavigationBar];
}
-(void) initTaleView{
    [self setTableView:[[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain]];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView  setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    //cell注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    [cell.textLabel setText:[NSString stringWithFormat:@"Row-%zd",indexPath.row]];
    [cell setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:1.0 / (arc4random()%5)]];//每个cell产生不一样的颜色
    
    return cell;
}
-(void)initNavigationBar{
    [self setNavigationBar:[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64)]];
    [self.navigationBar setBackgroundColor:[UIColor colorWithRed:227/255.0 green:180/255.0 blue:64/255.0 alpha:1]];
    [self.navigationBar setTranslucent:NO];
    [self.navigationController.view addSubview:self.navigationBar];
    for (UIView *subView in self.navigationBar.subviews) {
        if([subView isKindOfClass:[NSClassFromString(@"_UINavigationBarBackground") class]]){
            [subView removeFromSuperview];
        }
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIColor *color = self.navigationBar.backgroundColor;
    CGFloat offsetY = scrollView.contentOffset.y;//获取滚动的偏移量
    if(offsetY>0){
        CGFloat alpha = (200-offsetY)/200;
        self.navigationBar.backgroundColor = [color colorWithAlphaComponent:alpha];
    }
    else {
        self.navigationBar.backgroundColor = [color colorWithAlphaComponent:1];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"单击事件");
}
-(void)popController {
    //返回上一视图
    [self.navigationController popViewControllerAnimated:true];
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
