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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *postNumber;

@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@property (nonatomic,strong) PostSearchViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewModel = [[PostSearchViewModel alloc]init];
    
    [self bindViewModel];
}


- (void)bindViewModel {
    RAC(self.viewModel,enterNumber) = self.postNumber.rac_textSignal;
    
    self.searchBtn.rac_command = self.viewModel.searchCommand;
    
    [[self.searchBtn.rac_command.executionSignals switchToLatest]
     subscribeNext:^(id x) {
         NSLog(@"%@",x);
         [SVProgressHUD showSuccessWithStatus:@"获取成功"];
         
         ResultTableView *sec = [[ResultTableView alloc]init];
         sec.resultModel = [[ResultTableModel alloc]initWithDict:x];
         [self.navigationController pushViewController:sec animated:YES];
     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
