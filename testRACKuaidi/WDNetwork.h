//
//  WDNetwork.h
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface WDNetwork : NSObject

+ (RACSignal *)fetchResultWithNumber:(NSString *)code;

@end
