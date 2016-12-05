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

+ (RACSignal *)fetchResultWithNumber:(NSString *)code {
    [SVProgressHUD show];
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *urlStr = [NSString stringWithFormat:@"http://www.kuaidi100.com/query?type=shunfeng&postid=%@",code];
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

@end
