//
//  ResultTableViewModel.h
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultTableModel : NSObject

@property (nonatomic,copy) NSString *kdName; //SF

//成功 失败
@property (nonatomic,copy) NSString *status;

//物流信息 ARRAY
@property (nonatomic,strong) NSArray *dataArr;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
