//
//  main.m
//  MJ_TEST
//
//  Created by 卢育彪 on 2019/1/2.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"

void test1()
{
    int age = 10;
    
    void(^block1)(void) = ^{
        NSLog(@"-----");
    };
    
    void(^block2)(void) = ^{
        NSLog(@"-----%d", age);
    };
    
    id block3 = [block2 copy];
    
    NSLog(@"%@ %@ %@", [block1 class], [block2 class], [block3 class]);
    NSLog(@"%@ %@ %@", [[block1 copy] class], [[block2 copy] class], [[block3 copy] class]);
}

int a = 20;

void test2()
{
    int b = 10;
    
    void(^block1)(void) = ^{
        NSLog(@"-----");
    };
    
    void(^block2)(void) = ^{
        NSLog(@"-----%d", b);
    };
    
    id block3 = [block2 copy];
    
    id block1Cls = object_getClass(block1);
    id block2Cls = object_getClass(block2);
    id block3Cls = object_getClass(block3);
    
    NSLog(@"a--global--%p", &a);
    NSLog(@"b--auto place--%p", &b);
    NSLog(@"alloc----%p", [[NSObject alloc] init]);
    NSLog(@"Person----%p", [Person class]);
    
    NSLog(@"------block---instance---");
    NSLog(@"block1----%@ %p", [block1 class], block1);
    NSLog(@"block2----%@ %p", [block2 class], block2);
    NSLog(@"block3----%@ %p", [block3 class], block3);
    
    NSLog(@"------block---Class---");
    NSLog(@"block1Cls----%@ %p", block1Cls, block1Cls);
    NSLog(@"block2Cls----%@ %p", block2Cls, block2Cls);
    NSLog(@"block3Cls----%@ %p", block3Cls, block3Cls);
}

typedef void(^Block)(void);
Block block1;

void test3()
{
    int b = 10;
    
    block1 = [^{
        NSLog(@"-----%d", b);
    } copy];
    
    NSLog(@"%p %p", block1, object_getClass(block1));
    
}

void test4()
{
    int age = 10;
    int *agePtr = &age;
    NSLog(@"age---1:\n%d %p %d %p %p", age, &age, *agePtr, agePtr, &agePtr);
    
    block1 = [^{
        NSLog(@"age----2:\n%d %p %d %p %p", age, &age, *agePtr, agePtr, &agePtr);
    } copy];
    
}

void test5()
{
    NSString *strSource = @"abc";
    
    NSLog(@"source:\n%@ %p %p", strSource, strSource, &strSource);
    
    NSString *str1 = [strSource copy];
    
    NSLog(@"str1:\n%@ %p %p", str1, str1, &str1);
    
    NSString *str2 = [strSource mutableCopy];
    
    NSLog(@"str2:\n%@ %p %p", str2, str2, &str2);
    
}

void(^block)(void);

void test6()
{
    int age = 10;
    NSLog(@"age----%p", &age);
    
    block = ^{
        NSLog(@"age----%p", &age);
        NSLog(@"----%d", age);
    };
    
    
    
    NSLog(@"block--1---%p", block);
    NSLog(@"block class--1---%p", [block class]);
    id coBlock = [block copy];
    NSLog(@"%@", [coBlock class]);
    NSLog(@"block--2---%p", coBlock);
    NSLog(@"block class--2---%p", [coBlock class]);
}

void test7()
{
    int age = 10;
    int *agePtr = &age;
    NSLog(@"1----\n%d %p %d %p %p", age, &age, *agePtr, agePtr, &agePtr);
    
    block = ^{
        NSLog(@"1----\n%d %p %d %p %p", age, &age, *agePtr, agePtr, &agePtr);
    };
    
    id coBlock = [block copy];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        test1();
        
//        test2();
        
//        test3();
//        block1();
//        NSLog(@"%p %p", block1, object_getClass(block1));
//        int age = 10;
//        Block bl = ^{
//            NSLog(@"%d", age);
//        };
//        NSLog(@"%p %p", bl, object_getClass(bl));
//        block1();
//        block1();
//        block1();
        
//        test4();
//        block1();
//
//        test5();
        
//        test6();
//        block();
        
        test7();
        block();
        
    }
    return 0;
}


