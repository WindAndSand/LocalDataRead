//
//  Person.m
//  LocalDataRead
//
//  Created by 黄刚 on 2017/8/5.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#import "Person.h"

@implementation Person

//    NSKeyedArchiver归档（NSCoding）

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeFloat:self.height forKey:@"height"];
};

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.age = [aDecoder decodeIntForKey:@"age"];
    self.height = [aDecoder decodeFloatForKey:@"height"];
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@, age = %d, height = %f",self.name,self.age,self.height];
}
@end
