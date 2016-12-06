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
    
    RACSignal *validKindSignal = [RACObserve(self, expressKind)
                                  map:^id(NSString *value) {
                                      return @(value.length != 0 && ![value isEqualToString:@"请选择"]);
                                  }];
    
    
    RACSignal *validEnterCode = [RACObserve(self, enterNumber)
                                 map:^id(NSString *value) {
                                     return @(value.length >= 12);
                                 }];
    
    RACSignal *buttonSignal = [RACSignal
                               combineLatest:@[validKindSignal,validEnterCode]
                               reduce:^id(NSNumber *kind, NSNumber *code){
                                   return @([kind boolValue] && [code boolValue]);
                               }];
    
    self.searchCommand = [[RACCommand alloc]initWithEnabled:buttonSignal signalBlock:^RACSignal *(id input) {
        return [WDNetwork fetchResultWithNumber:self.enterNumber kind:self.expressKind];
    }];
}

@end
