//
//  Lsh_KVO.h
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ChangeBlock)(id _Nullable changeValue,id _Nullable old);

@interface Lsh_KVO : NSObject
+ (instancetype _Nullable)LshInstance;

/**
 * observe 被观察的类
 * property 被观察的属性
 * change block 传值
 */
- (instancetype _Nullable )lshAddObserve:(NSObject *_Nullable)observe property:(NSString *_Nullable)property change:(ChangeBlock _Nullable )change;

@end
