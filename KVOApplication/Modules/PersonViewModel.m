//
//  PersonViewModel.m
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "PersonViewModel.h"

@implementation PersonViewModel



- (void)getDataFromService:(void(^)(void))success faile:(void(^)(void))failure {
    self.success = NO;
    //模拟网络请求
    self.dataModel = [[PersonModel alloc] init];
    self.dataModel.name = @"123";
    self.dataModel.height = 456;
    
    self.dataSource = @[self.dataModel];
    self.dataSource = nil;
    //成功
    self.success = YES;
    success();
}
@end
