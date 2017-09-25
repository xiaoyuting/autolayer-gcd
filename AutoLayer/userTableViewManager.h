//
//  userTableViewManager.h
//  AutoLayer
//
//  Created by 雨停 on 2017/9/25.
//  Copyright © 2017年 autolayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface userTableViewManager : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *userTableView;
@property (nonatomic, weak) NSArray *dataSourArray;
-(id)initWithTableView :(UITableView  *)tableView;
@end
