//
//  PostSearchViewModel.h
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface PostSearchViewModel : NSObject

@property (nonatomic,copy) NSString *enterNumber;

@property (nonatomic,strong) RACCommand *searchCommand;

@end
