//
//  ViewController.m
//  testRACKuaidi
//
//  Created by tb on 16/12/5.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ViewController.h"
#import "PostSearchViewModel.h"
#import <ReactiveCocoa.h>
#import "ResultTableView.h"
#import <SVProgressHUD.h>
#import "ExpressKindPickerView.h"

@interface ViewController ()
//快递种类
@property (weak, nonatomic) IBOutlet UITextField *kindPicker;

//快递单号
@property (weak, nonatomic) IBOutlet UITextField *expressNumber;

@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@property (nonatomic,strong) PostSearchViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ExpressKindPickerView *express = [[ExpressKindPickerView alloc]init];
    self.kindPicker.inputView = express;
    
    @weakify(self);
    express.selectKind = ^(NSString *kindStr) {
        @strongify(self);
        self.kindPicker.text = [kindStr isEqualToString:@"请选择"] ? @"" : kindStr;
        [self.kindPicker resignFirstResponder];
    };
    
    self.expressNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.expressNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.viewModel = [[PostSearchViewModel alloc]init];
    
    [self bindViewModel];
}


- (void)bindViewModel {
    RAC(self.viewModel,enterNumber) = self.expressNumber.rac_textSignal;
    RAC(self.viewModel,expressKind) = self.kindPicker.rac_textSignal;
    
    
    self.searchBtn.rac_command = self.viewModel.searchCommand;
    
    @weakify(self);
    [[self.searchBtn.rac_command.executionSignals switchToLatest]
     subscribeNext:^(id x) {
         @strongify(self);
         [self textfieldLostFirstResponse];
         [SVProgressHUD showSuccessWithStatus:x[@"message"]];
         
         ResultTableView *sec = [[ResultTableView alloc]init];
         sec.resultModel = [[ResultTableModel alloc]initWithDict:x];
         sec.hidesBottomBarWhenPushed = YES;
         [self.navigationController pushViewController:sec animated:YES];
     }];
}

#pragma mark -
- (void)textfieldLostFirstResponse {
    [self.kindPicker resignFirstResponder];
    [self.expressNumber resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self textfieldLostFirstResponse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
