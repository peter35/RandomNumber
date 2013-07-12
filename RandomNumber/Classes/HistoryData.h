//
//  HistoryData.h
//  RandomNumber
//
//  Created by Peter on 13-6-24.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum{
    kShuangseqiu = 0,
    kDaletou
}LotteryType;

//NSString * const kType = @"type";
//NSString * const kIssue = @"issue";
//NSString * const kData = @"data";

@interface HistoryData : NSObject

@property (nonatomic, assign) LotteryType lotteryType;
@property (nonatomic, retain) NSString * issue;
@property (nonatomic, retain) NSString * num1;
@property (nonatomic, retain) NSString * num2;
@property (nonatomic, retain) NSString * num3;
@property (nonatomic, retain) NSString * num4;
@property (nonatomic, retain) NSString * num5;
@property (nonatomic, retain) NSString * num6;
@property (nonatomic, retain) NSString * num7;


-(id)initWithDictionary:(NSDictionary *)dict;
//-(id)initWithString:(NSString *)sData;

@end
