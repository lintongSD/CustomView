//
//  ViewController.m
//  CustomView
//
//  Created by 全速 on 2018/6/19.
//  Copyright © 2018年 lin-tong. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = @[@"详情按钮", @"详情View", @"设置图片位置的按钮", @"按钮倒计时", @"打开系统url", @"同意条款"];
    [self createTableView];
}

#pragma mark----tableView
static NSString *cellId = @"cellId";
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:_tableView];
    [self updateFrame];
}

- (void)updateFrame{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowViewController *show = [ShowViewController new];
    show.index = indexPath.row;
    show.title = self.titleArr[indexPath.row];
    [self.navigationController pushViewController:show animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
