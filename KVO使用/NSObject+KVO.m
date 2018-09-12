//
//  NSObject+KVO.m
//  KVO使用
//
//  Created by XieHenry on 2018/9/10.
//  Copyright © 2018年 XieHenry. All rights reserved.
// OC 的方法调用里面有2个隐藏的参数， self 方法的调用者 _cmd 方法编号

#import "NSObject+KVO.h"
#import <objc/message.h>


NSString *const ObserverKey = @"ObserverKey";
@implementation NSObject (KVO)

- (void)X_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
    // 把观察者保存到当前对象
    objc_setAssociatedObject(self, (__bridge const void *)(ObserverKey), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 修改对象isa指针
    object_setClass(self, [X_NSKVONotyfing_Person class]);
}



@end
