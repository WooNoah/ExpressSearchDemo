//
//  ExpressKindPickerView.h
//  testRACKuaidi
//
//  Created by 吴迪 on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

@interface ExpressKindPickerView : UIPickerView

@property (strong, nonatomic) RACCommand *selectCommand;

@property (nonatomic,copy) void(^selectKind)(NSString *kindStr);

@end
