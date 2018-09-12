//
//  ViewController.m
//  KVO使用
//
//  Created by XieHenry on 2018/9/10.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "NSObject+KVO.h"

@interface ViewController ()
@property (nonatomic,strong) Person *p;

@end

@implementation ViewController


/*  原理  swizzling-isa
 1.动态创建Person的子类NSKVONotifying_Person（利用RunTime）
 2.重写setPersonName：，在内部回复父类的做法
 3.动态的修改了P对象的类型！让它变成子类类型。
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //系统的方法
//    [self xitongDemo];
    
    //自定义的方法
    [self zidingyiDemo];
    
}

//MARK:自定义的方法
-(void)zidingyiDemo {
    self.p = [[Person alloc] init];

    [self.p X_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    self.p.name = @"ZDY";
}

//MARK:系统的方法
-(void)xitongDemo {
    self.p = [[Person alloc] init];
    
    /*此行注册监听后，p由Person类变成NSKVONotyfing_Person类，可以通过打印 object_getClass(self.p) 查看。
     */
    //Person
    [self.p addObserver:self forKeyPath:@"personName" options:NSKeyValueObservingOptionNew context:nil];
    [self.p addObserver:self forKeyPath:@"personAge" options:NSKeyValueObservingOptionNew context:nil];
    
    
    /*Dog---如果需要查看dogName和dogAge需要2次的注册监听，如果属性太多，可以加一个依赖关系。只需要订阅一次，但是需要实现Person中的keyPathsForValuesAffectingValueForKey方法。
     */
    [self.p addObserver:self forKeyPath:@"dog" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //会调用self.p 的set方法，注意，此时的self.p 属于NSKVONotyfing_Person类
    
    //MARK:Person
    /*因为在Person中automaticallyNotifiesObserversForKey设置为了手动触发，因此需要调用下面的方法。*/
    [self.p willChangeValueForKey:@"personName"]; //即将改变
    self.p.personName = @"XieHenry";
    [self.p didChangeValueForKey:@"personName"]; //已经改变

    self.p.personAge = @"18";

    [self.p.personArray addObject:@"1"]; //TODO:

    
    /**********************MARK:Dog****************************/
    self.p.dog.dogName = @"xiaobai";
    self.p.dog.dogAge = @"1";
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    /*如果需要取Dog里面的值，有2中方法
     1.
     Person *p = object;
     NSLog(@"%@",p.dog.dogName);
     
     2.
     Dog *d = change[@"new"];
     NSLog(@"%@",d.dogName);
     */
    
    NSLog(@"%@监听到%@属性的改变为%@",object,keyPath,change);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
