//
//  Person.m
//  KVO使用
//
//  Created by XieHenry on 2018/9/10.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "Person.h"

@implementation Person


-(instancetype)init {
    if (self = [super init]) {
        self.dog = [[Dog alloc] init];
        self.personArray = [NSMutableArray array];
    }
    return self;
}


//让你返回一个容器，放NSString *类型
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) {
        NSArray *dogKeys = @[@"_dog.dogName",@"_dog.dogAge"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:dogKeys];
    }
    return keyPaths;
}


//如果需要自定义，需要重写此方法，默认返回YES
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"personName"]) {
        return NO;
    }
    return YES; //YES 自动触发  NO 手动触发
}

@end
