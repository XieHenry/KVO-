//
//  NSObject+KVO.h
//  KVO使用
//
//  Created by XieHenry on 2018/9/10.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "X_NSKVONotyfing_Person.h"


@interface NSObject (KVO)

- (void)X_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
