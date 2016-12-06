//
//  ExpressKindPickerView.m
//  testRACKuaidi
//
//  Created by 吴迪 on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ExpressKindPickerView.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ExpressKindPickerView() <UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *kindArr;

@end

@implementation ExpressKindPickerView


- (instancetype)init {
    if (self = [super init]) {
        [self setupKindPicker];
    }
    return self;
}


- (void)setupKindPicker {
    
    self.kindArr = @[@{@"picture":@"",@"name":@"请选择"},
                     @{@"picture":@"shunfeng",@"name":@"顺丰"},
                     @{@"picture":@"ems",@"name":@"EMS"},
                     @{@"picture":@"shentong",@"name":@"申通"},
                     @{@"picture":@"yuantong",@"name":@"圆通"},
                     @{@"picture":@"huitong",@"name":@"汇通"},
                     @{@"picture":@"zhongtong",@"name":@"中通"},
                     @{@"picture":@"yunda",@"name":@"韵达"}];
    
    self.frame = CGRectMake(0, 0, KScreenWidth, 200);
    self.delegate = self;
    self.dataSource = self;
//    self.userInteractionEnabled = YES;
//    
//    UIButton *cancelBtn = [[UIButton alloc]init];
//    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
//    cancelBtn.backgroundColor = [UIColor greenColor];
//    cancelBtn.frame = CGRectMake(5, 3, 50, 20);
//    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:cancelBtn];
//    
//    UIButton *sureBtn = [[UIButton alloc]init];
//    [sureBtn setTitle:@"sure" forState:UIControlStateNormal];
//    sureBtn.frame = CGRectMake(KScreenWidth - 55, 3, 50, 20);
//    [sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:sureBtn];
    
}

#pragma mark - 
//- (void)cancelAction {
//    [self.superview endEditing:YES];
//}
//
//- (void)sureAction {
//    NSLog(@"sureAction");
//    if (self.selectKind) {
//        self.selectKind(self.kindArr[self.selectIndex][@"name"]);
//    }
//}

#pragma mark - delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.kindArr.count;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIButton *imgBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth/2, 35)];
    [imgBtn setImage:[UIImage imageNamed:self.kindArr[row][@"picture"]] forState:UIControlStateNormal];
    [imgBtn setTitle:self.kindArr[row][@"name"] forState:UIControlStateNormal];
    
    return imgBtn;
}

//有上面的ViewForRow方法，则该方法不会调用
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.kindArr[row][@"name"];
}



- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 35;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.selectKind) {
        self.selectKind(self.kindArr[row][@"name"]);
    }
}


@end
