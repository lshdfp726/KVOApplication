//
//  Lsh_KVO.m
//  KVOApplication
//
//  Created by fns on 2017/11/13.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "Lsh_KVO.h"
#import "lsh_Runtime.h"

@interface Lsh_KVO ()
@property (nonatomic, strong, nullable) NSString *OBProperty;//要观察的属性
@property (nonatomic, strong, nullable) NSObject *OB;//要观察的对象
@property (nonatomic, strong, nullable) NSString *attributeDesc;//属性描述，判断OBProperty是什么类型
@property (nonatomic, copy  , nullable) ChangeBlock changeBlock;
@end


@implementation Lsh_KVO
+ (instancetype)LshInstance {
    return [[[self class] alloc] init];
}


- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


//添加观察者
- (instancetype)lshAddObserve:(NSObject *_Nullable)observe property:(NSString *_Nullable)property change:(ChangeBlock)change {
    _OB = observe;
    _OBProperty = property;
    _changeBlock = change;
    //属性分析，对一些特里要转换一下
    
    [observe addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionNew context:nil];
    return self;
}


//值变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath compare:_OBProperty] == 0) {
        if (_changeBlock) {
            _changeBlock(change[@"new"],nil);
        }
    }
}


////属性分析，对一些特里要转换一下如BOOL
//- (NSString *)attributeAttribute {
//    return [lsh_Runtime attributeAnalyse:_OB attribute:_OBProperty];
//}


- (void)dealloc {
    [_OB removeObserver:self forKeyPath:_OBProperty];
}

@end
