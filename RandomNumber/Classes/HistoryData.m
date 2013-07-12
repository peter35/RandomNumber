//
//  HistoryData.m
//  RandomNumber
//
//  Created by Peter on 13-6-24.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import "HistoryData.h"

@implementation HistoryData


-(void)dealloc{
    self.issue = nil;
    self.num1 = nil;
    self.num2 = nil;
    self.num3 = nil;
    self.num4= nil;
    self.num5 = nil;
    self.num6 = nil;
    self.num7 = nil;
    [super dealloc];
}


-(id)initWithDictionary:(NSDictionary *)dict{
    
    if (self = [super init]) {
        self.lotteryType = [[dict objectForKey:@"type"]integerValue];
        self.issue = [dict objectForKey:@"issue"];
        NSString * str = [dict objectForKey:@"data"];
        NSArray * arr = [str componentsSeparatedByString:@","];
        self.num1 = [arr objectAtIndex:0];
        self.num2 = [arr objectAtIndex:1];
        self.num3 = [arr objectAtIndex:2];
        self.num4 = [arr objectAtIndex:3];
        self.num5 = [arr objectAtIndex:4];
        self.num6 = [arr objectAtIndex:5];
        self.num7 = [arr objectAtIndex:6];
        
        
        
    }
    return self;

}

@end
