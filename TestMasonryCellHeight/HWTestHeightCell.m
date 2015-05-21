//
//  HWTestHeightCell.m
//  TestMasonryCellHeight
//
//  Created by Heath on 15/5/21.
//  Copyright (c) 2015年 Heath. All rights reserved.
//

#import "HWTestHeightCell.h"
#import <Masonry.h>

@interface HWTestHeightCell ()

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblBody;

@end

@implementation HWTestHeightCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.lblTitle];
        [self.contentView addSubview:self.lblBody];
        
        [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.height.equalTo(@22);
        }];
        
        [self.lblBody mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.lblTitle);
            make.left.equalTo(self.lblTitle);
            make.top.mas_equalTo(self.lblTitle.mas_bottom).offset(10);
            make.bottom.equalTo(@-20);
        }];
    }
    return self;
}

- (void)updateHeightCell:(NSDictionary *)item {
    self.lblTitle.text = [item objectForKey:@"title"];
    self.lblBody.text = [item objectForKey:@"body"];
}

#pragma mark - Getter

- (UILabel *)lblTitle {
    if (!_lblTitle) {
        _lblTitle = [UILabel new];
        _lblTitle.backgroundColor = [UIColor yellowColor];
    }
    return _lblTitle;
}

- (UILabel *)lblBody {
    if (!_lblBody) {
        _lblBody = [UILabel new];
        _lblBody.numberOfLines = 0;
        _lblBody.backgroundColor = [UIColor redColor];
    }
    return _lblBody;
}

@end
