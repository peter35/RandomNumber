//
//  BallView.h
//  RandomNumber
//
//  Created by Peter on 13-7-12.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  enum{
    kRedBall,
    kBlueBall
}BallType;

typedef enum{
    kSwitchType,
    kLongType
}BallTouchType;

@interface BallView : UIView{
    NSUInteger numCount;
}

@property (nonatomic, assign) BallType ballType;
@property (nonatomic, assign) BallTouchType touchType;


- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

@end
