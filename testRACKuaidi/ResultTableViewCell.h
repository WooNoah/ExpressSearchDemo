//
//  ResultTableViewCell.h
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *locationLbl;

@property (nonatomic,strong) IBOutlet UILabel *timeLbl;

@property (nonatomic,strong) IBOutlet UILabel *contentLbl;

- (void)configureContentWithDictionary:(NSDictionary *)dict;

@end
