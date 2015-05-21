//
//  HWTestHeightCell.h
//  TestMasonryCellHeight
//
//  Created by Heath on 15/5/21.
//  Copyright (c) 2015年 Heath. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kHWTestHeightCellIdentifier = @"kHWTestHeightCellIdentifier";

@interface HWTestHeightCell : UITableViewCell

- (void)updateHeightCell:(NSDictionary *)item;

@end
