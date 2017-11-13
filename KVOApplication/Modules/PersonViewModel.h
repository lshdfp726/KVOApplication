//
//  PersonViewModel.h
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"

@interface PersonViewModel : NSObject
@property (nonatomic, assign) BOOL success;//请求成功
@property (nonatomic, assign) NSArray *dataSource;//数据源
@property (nonatomic, strong) PersonModel *dataModel;//数据源


- (void)getDataFromService:(void(^)(void))success faile:(void(^)(void))failure;
@end
