//
//  PostSearchViewModel.m
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "PostSearchViewModel.h"
#import "WDNetwork.h"

@implementation PostSearchViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self configViewModel];
    }
    return self;
}


- (void)configViewModel {
    NSLog(@"%@",self.enterNumber);
    
    
    RACSignal *validEnterCode = [RACObserve(self, enterNumber)
                                 map:^id(NSString *value) {
                                     return @(value.length >= 12);
                                 }];
    
//    [validEnterCode subscribeNext:^(NSNumber *x) {
//        if ([x boolValue]) {
//            
//        }
//        else {
//            
//        }
//    }];
    
    
//    self.searchCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
//        return [WDNetwork fetchResultWithNumber:self.enterNumber];
//    }];
    
    self.searchCommand = [[RACCommand alloc]initWithEnabled:validEnterCode signalBlock:^RACSignal *(id input) {
        return [WDNetwork fetchResultWithNumber:self.enterNumber];
    }];
}

@end
