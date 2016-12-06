//
//  WDNetwork.m
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "WDNetwork.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

static WDNetwork *_httpManager;

@interface WDNetwork()

@property (nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation WDNetwork

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_httpManager) {
            _httpManager = [[WDNetwork alloc]init];
        }
    });
    return _httpManager;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initializeHTTP];
    }
    return self;
}

- (void)initializeHTTP {
    self.manager = [AFHTTPSessionManager manager];
//    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
}

+ (RACSignal *)fetchResultWithNumber:(NSString *)code kind:(NSString *)kindStr{
    [SVProgressHUD show];
    NSString *kind = [self matchingTheParameterKindWithString:kindStr];
    
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *urlStr = [NSString stringWithFormat:@"http://www.kuaidi100.com/query?type=%@&postid=%@",kind,code];
        [[WDNetwork shareInstance].manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }];
        return nil;
    }];
}

///转换textfield传过来的快递类型 为相应的参数类型
+ (NSString *)matchingTheParameterKindWithString:(NSString *)kindStr {
    NSString *paramKind;
    if ([kindStr isEqualToString:@"顺丰"]) {
        paramKind = @"shunfeng";
    }else if ([kindStr isEqualToString:@"EMS"]) {
        paramKind = @"ems";
    }else if ([kindStr isEqualToString:@"申通"]) {
        paramKind = @"shentong";
    }else if ([kindStr isEqualToString:@"圆通"]) {
        paramKind = @"yuantong";
    }else if ([kindStr isEqualToString:@"汇通"]) {
        paramKind = @"huitongkuaidi";
    }else if ([kindStr isEqualToString:@"韵达"]) {
        paramKind = @"yunda";
    }else if ([kindStr isEqualToString:@"中通"]){
        paramKind = @"zhongtong";
    }else {
        paramKind = @"";
    }
    return paramKind;
}

@end
