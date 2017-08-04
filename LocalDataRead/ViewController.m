//
//  ViewController.m
//  LocalDataRead
//
//  Created by 黄刚 on 2017/8/4.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self archiveXML];
    [self readXML];
    
    [self savePreference];
    [self readPreference];
    
    [self createPerson];
    [self readPerson];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//    应用沙盒
- (NSString *) rootOfSandbox
{

    NSString *home = NSHomeDirectory(); //沙盒根目录
    
//    不建议采用，因为新版本的操作系统可能会修改目录名
    NSString *documents = [home stringByAppendingPathComponent:@"Documents/Stu.plist"];
    NSLog(@"-----%@",documents);
    
//      NSUserDomainMask 代表从用户文件夹下找, YES 代表展开路径中的波浪字符“~”
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
// 在iOS中，只有一个目录跟传入的参数匹配，所以这个集合里面只有一个元素
    NSString *documentsOne = [array objectAtIndex:0];
    
    return documents;
    
}


//    XML属性列表归档
//    将一个NSDictionary对象归档到一个plist属性列表中
- (void) archiveXML
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"母鸡" forKey:@"name"];
    [dict setObject:@"17133853768" forKey:@"phone"];
    [dict setObject:@"27" forKey:@"age"];
    
    NSString *path =[self rootOfSandbox];
//     将字典持久化到Documents/stu.plist文件中
    [dict writeToFile:path atomically:YES];
}

- (void)readXML
{
    NSString *path = [self rootOfSandbox];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSLog(@"%@",dict);
}



- (void)savePreference
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"狩猎" forKey:@"蓝色铭文"];
    [defaults setObject:@"荆轲" forKey:@"无尽战刃"];
    [defaults setObject:@"phone" forKey:@"530/2000"];
    
//    强制数据保存
    [defaults synchronize];
    
}


- (void)readPreference
{
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    NSString *username = [defautls objectForKey:@"无尽战刃"];
    NSLog(@"defaults:%@",username);
}


- (void)createPerson
{
    Person *p = [[Person alloc] init];
    p.age = 20;
    p.name = @"Rio";
    p.height = 1750;
    
    //获得Document的路径
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:@"person.archiver"];//拓展名可以自己随便取
    
    [NSKeyedArchiver archiveRootObject:p toFile:path];
}


- (void)readPerson
{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:@"person.archiver"];
    
    Person *person1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@",person1);
}

@end
