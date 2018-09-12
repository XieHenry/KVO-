//
//  Person.h
//  KVO使用
//
//  Created by XieHenry on 2018/9/10.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject
@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *personName;
@property (nonatomic,copy) NSString *personAge;
@property (nonatomic, strong) NSMutableArray *personArray;

@property (nonatomic,strong) Dog *dog;

@end
