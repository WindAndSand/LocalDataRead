//
//  Person.h
//  LocalDataRead
//
//  Created by 黄刚 on 2017/8/5.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) int age;
@property(nonatomic, assign) float height;

@end
