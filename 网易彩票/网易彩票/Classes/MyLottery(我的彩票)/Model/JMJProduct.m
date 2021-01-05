//
//  JMJProduct.m
//  网易彩票
//
//  Created by HUST on 2020/12/30.
//

#import "JMJProduct.h"

@implementation JMJProduct

+(instancetype)productWithDict:(NSDictionary *)dict
{
    JMJProduct *p=[[self alloc]init];
    p.title = dict[@"title"];
    p.stitle = dict[@"stitle"];
    p.ids = dict[@"id"];
    p.url = dict[@"url"];
    p.icon = dict[@"icon"];
    p.customUrl = dict[@"customUrl"];
    return p;
}

@end
