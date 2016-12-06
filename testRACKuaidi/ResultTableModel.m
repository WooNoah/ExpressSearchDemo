//
//  ResultTableViewModel.m
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ResultTableModel.h"

#define textFont 13
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

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
    self.kdNumber = dict[@"nu"];
    
    
    NSInteger statusCode = [dict[@"status"] integerValue];
    switch (statusCode) {
        case 0:
            self.status = @"暂无结果";
            break;
        
        case 1: case 200:
            self.status = @"查询成功";
            break;
            
        case 2:
            self.status = @"接口异常";
            break;
        default:
            break;
    }
    
    NSInteger stateCode = [dict[@"state"] integerValue];
    switch (stateCode) {
        case 0:
            self.state = @"在途(货物处于运输过程中)";
            break;
        
        case 1:
            self.state = @"揽件(货物已由快递公司揽收并且产生了第一条跟踪信息)";
            break;
            
        case 2:
            self.state = @"疑难(货物寄送过程出了问题)";
            break;
            
        case 3:
            self.state = @"签收(收件人已签收)";
            break;
            
        case 4:
            self.state = @"退签(货物由于用户拒签、超区等原因退回，而且发件人已经签收)";
            break;
            
        case 5:
            self.state = @"派件(快递正在进行同城派件)";
            break;
            
        case 6:
            self.state = @"退回(货物正处于退回发件人的途中)";
            break;
            
        default:
            break;
    }
    
    self.dataArr = dict[@"data"];
}

///本类中多个地方需要计算文字的高度 所以将此块代码封装为一个函数 方便调用
- (CGFloat)calculateHeightOfText:(NSDictionary *)text
{
    //NSString方法 计算文字宽度（高度一定）或高度（宽度一定） 返回一个rect
    //1.限制大小 2.绘制选项 3.属性（字号大小） 4.一般传nil
    CGRect rect = [text[@"context"] boundingRectWithSize:CGSizeMake(KScreenWidth - 40, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:textFont]} context:nil];
    //官方建议使用ceil函数 返回大于等于本数的最小整数
    //floor(<#double#>) 返回小于等于本数的最大整数
    CGFloat height = ceilf(rect.size.height);
    //29是动态计算出来的高度 + 约束里边 notiTimeLabel高度+距离cell顶的距离 + notiContentLabel 距离 notiTimeLabel 距离 和距离cell底距离
    return height + 45 ;
}

@end
