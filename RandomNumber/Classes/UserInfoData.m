//
//  UserInfoData.m
//  RandomNumber
//
//  Created by Peter on 13-6-24.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import "UserInfoData.h"

@implementation UserInfoData

-(void)dealloc{
    NSLog(@"data:dealloc");

    self.gDate = nil;
    self.nDate = nil;
    self.sSex = nil;
    [super dealloc];
}

@end
