//
//  X_NSKVONotyfing_Person.m
//  KVO使用
//
//  Created by XieHenry on 2018/9/12.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "X_NSKVONotyfing_Person.h"
#import <objc/runtime.h>

extern NSString *const ObserverKey;
@implementation X_NSKVONotyfing_Person

- (void)setName:(NSString *)name{
    NSString *oldName = self.name;
    // 获取观察者
    id obsetver = objc_getAssociatedObject(self, ObserverKey);
    NSDictionary<NSKeyValueChangeKey,id> *changeDict = oldName ? @{NSKeyValueChangeNewKey : name, NSKeyValueChangeOldKey : oldName} : @{NSKeyValueChangeNewKey : name};
    [obsetver observeValueForKeyPath:@"name" ofObject:self change:changeDict context:nil];
}


@end
