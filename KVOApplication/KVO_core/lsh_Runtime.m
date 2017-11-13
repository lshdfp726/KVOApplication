//
//  lsh_Runtime.m
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "lsh_Runtime.h"
#import <objc/runtime.h>

@implementation lsh_Runtime

//属性分析
+ (NSString *)attributeAnalyse:(NSObject *)obj attribute:(NSString *)propertyName {
    const char *c     = [propertyName UTF8String];
    objc_property_t p =  class_getProperty([obj class], c);
    const char *type  = property_getAttributes(p);
    
    NSString *result = nil;
    switch (type[1]) {
        case 'B'://布尔值
            result = @"BOOL";
            break;
        case '@'://对象
            result = @"Object";
        default:
            break;
    }
    return result;
}

@end
