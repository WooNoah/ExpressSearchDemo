//
//  ResultTableViewCell.m
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ResultTableViewCell.h"

@implementation ResultTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureContentWithDictionary:(NSDictionary *)dict
{
    self.locationLbl.text = [dict[@"location"] isEqualToString:@"null"] ? @" " : dict[@"location"];
    
    self.timeLbl.text = dict[@"time"];
    
    self.contentLbl.text = dict[@"context"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
