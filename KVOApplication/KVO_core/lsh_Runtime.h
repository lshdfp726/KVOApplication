//
//  lsh_Runtime.h
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface lsh_Runtime : NSObject
/**
 * obj 要分析的对象
 * propertyName 要分析的对象属性
 */

+ (NSString *)attributeAnalyse:(NSObject *)obj attribute:(NSString *)propertyName;//属性分析
@end
