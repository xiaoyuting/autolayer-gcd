//
//  userTableViewManager.m
//  AutoLayer
//
//  Created by 雨停 on 2017/9/25.
//  Copyright © 2017年 autolayer. All rights reserved.
//

#import "userTableViewManager.h"

@implementation userTableViewManager
- (id)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        self.userTableView = tableView;
        self.userTableView.delegate = self;
        self.userTableView.dataSource = self;
    }
    return self; }
- (void)setDataSourArray:(NSArray *)dataSourArray {
    _dataSourArray = dataSourArray;
    [self.userTableView reloadData]; }
#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    return cell; }
@end
