//
//  HWTestTableViewController.m
//  TestMasonryCellHeight
//
//  Created by Heath on 15/5/21.
//  Copyright (c) 2015年 Heath. All rights reserved.
//

#import "HWTestTableViewController.h"
#import <Masonry.h>
#import <UITableView+FDTemplateLayoutCell.h>
#import "HWTestHeightCell.h"
#import "RJModel.h"

@interface HWTestTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RJModel *aRJModel;

@end

@implementation HWTestTableViewController


- (void)loadView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)viewDidLayoutSubviews {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.aRJModel.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HWTestHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:kHWTestHeightCellIdentifier];
    NSDictionary *item = self.aRJModel.dataSource[indexPath.row];
    [cell updateHeightCell:item];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:kHWTestHeightCellIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
        NSDictionary *item = self.aRJModel.dataSource[indexPath.row];
        [cell updateHeightCell:item];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HWTestHeightCell class] forCellReuseIdentifier:kHWTestHeightCellIdentifier];
    }
    
    return _tableView;
}

- (RJModel *)aRJModel {
    if (!_aRJModel) {
        _aRJModel = [RJModel new];
        [_aRJModel populateDataSource];
    }
    return _aRJModel;
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
