//
//  ResultTableViewModel.m
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ResultTableModel.h"

@implementation ResultTableModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    NSLog(@"initWithDict");
    if (self = [super init]) {
        [self addDictToModel:dict];
    }
    return self;
}

- (void)addDictToModel:(NSDictionary *)dict {
    self.kdName = dict[@"com"];
    
    self.status = [dict[@"status"] isEqualToString:@"200"] ? @"成功" : @"失败";
    
    self.dataArr = dict[@"data"];
}

@end
