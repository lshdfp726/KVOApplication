//
//  PersonVC.m
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "PersonVC.h"
#import "PersonViewModel.h"
#import "Lsh_KVO.h"

@interface PersonVC ()
@property (nonatomic, strong, nonnull) PersonViewModel *viewModel;
@property (nonatomic, strong, nullable) Lsh_KVO *result;
@property (nonatomic, strong, nullable) Lsh_KVO *bindDataSource;
@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self bindViewModel];
    [self requestData];
}


- (void)config {
    _viewModel = [[PersonViewModel alloc] init];
}


- (void)requestData {
    [_viewModel getDataFromService:^{
        
    } faile:^{
        
    }];
}


- (void)bindViewModel {
    Lsh_KVO *result = [[Lsh_KVO LshInstance] lshAddObserve:self.viewModel property:@"success" change:^(id  _Nullable new, id  _Nullable old) {
        BOOL success = [new boolValue];
        if (success) {
            //do anything
            NSLog(@"数据返回成功");
        } else {
            NSLog(@"数据返回失败");
        }
    }];
    self.result = result;
    
    self.bindDataSource = [[Lsh_KVO LshInstance] lshAddObserve:self.viewModel property:@"dataSource" change:^(id  _Nullable changeValue, id  _Nullable old) {
        
    }];
    
    
}


- (void)dealloc {
    NSLog(@"释放了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
