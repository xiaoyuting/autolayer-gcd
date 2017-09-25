//
//  spaceLab.m
//  AutoLayer
//
//  Created by 雨停 on 2017/9/19.
//  Copyright © 2017年 autolayer. All rights reserved.
//

#import "spaceLab.h"

@implementation spaceLab
-(CGSize)intrinsicContentSize{
    CGSize originalSize = [super intrinsicContentSize];
    CGSize size = CGSizeMake(originalSize.width+20, originalSize.height+20);
    return size;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
