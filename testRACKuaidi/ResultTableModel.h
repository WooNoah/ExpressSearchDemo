//
//  ResultTableViewModel.h
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ResultTableModel : NSObject

//物流公司编号
@property (nonatomic,copy) NSString *kdName;

//快递单号
@property (nonatomic,copy) NSString *kdNumber;

/*
 state	快递单当前的状态 ：
 0：在途，即货物处于运输过程中；
 1：揽件，货物已由快递公司揽收并且产生了第一条跟踪信息；
 2：疑难，货物寄送过程出了问题；
 3：签收，收件人已签收；
 4：退签，即货物由于用户拒签、超区等原因退回，而且发件人已经签收；
 5：派件，即快递正在进行同城派件；
 6：退回，货物正处于退回发件人的途中；
 */
@property (nonatomic,copy) NSString *state;

/*
 status	查询结果状态：
 0：无结果
 1：成功
 2：异常
 */
@property (nonatomic,copy) NSString *status;

//物流信息 ARRAY
@property (nonatomic,strong) NSArray *dataArr;

- (instancetype)initWithDict:(NSDictionary *)dict;



- (CGFloat)calculateHeightOfText:(NSDictionary *)text;

@end
