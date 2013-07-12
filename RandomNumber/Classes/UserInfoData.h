//
//  UserInfoData.h
//  RandomNumber
//
//  Created by Peter on 13-6-24.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum{
    kBaiyang = 1,
    kJinniu = 2,
    kShuangzi,
    
    kJuxie,
    kShizi,
    kChunv,
    
    kTianxie,
    kTiancheng,
    kSheshou,
    
    kMoxie,
    kShuiping,
    kShuangyu
}XingzuoType;

@interface UserInfoData : NSObject

@property (nonatomic, retain)NSString * gDate;
@property (nonatomic, retain)NSString * nDate;
@property (nonatomic, retain)NSString * sSex;
@property (nonatomic, assign)XingzuoType  xingzuoType;


@end
