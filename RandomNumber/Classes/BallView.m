//
//  BallView.m
//  RandomNumber
//
//  Created by Peter on 13-7-12.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import "ballView.h"

#define kBallWidth  30.0
#define kBallHeight  30.0
#define kNumLabelHeight 10.0

#define kMaxMultiple  8
#define COLOR(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]


@implementation BallView

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIButton * ballBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [ballBtn setFrame:CGRectMake(0, 0, kBallWidth, kBallWidth)];
        ballBtn.center = CGPointMake(self.frame.size.width/2, (self.frame.size.height - kNumLabelHeight)/2);
        [ballBtn addTarget:self action:@selector(touchTheBall:) forControlEvents:UIControlEventTouchUpInside];
        [ballBtn setTitle:title forState:UIControlStateNormal];
        ballBtn.tag = 6;
        [ballBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:ballBtn];
        
        
        UILabel * numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, kBallHeight, self.frame.size.width, kNumLabelHeight)];
        [numLabel setTextAlignment:NSTextAlignmentCenter];
        [numLabel setFont:[UIFont systemFontOfSize:10.0]];
        numLabel.tag = 8;
        [self addSubview:numLabel];
        [numLabel release];
            //全部用arc
    }
    return self;
}

-(void)setBallTitle:(NSString *)title{
    
}

-(void)touchTheBall:(id)sender{
    UIButton * btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (self.touchType == kSwitchType) {
        if (btn.selected) {
            if (self.ballType == kRedBall) {
                [btn setBackgroundColor:COLOR(255, 0, 0)];
            }else{
                [btn setBackgroundColor:COLOR(0, 0, 255)];
            }
        }else{
            [btn setBackgroundColor:[UIColor clearColor]];
        }

    }else{
        numCount ++;
        UILabel * lab = (UILabel *)[self viewWithTag:8];
        lab.text = [NSString stringWithFormat:@"%d",numCount];
        float  unit = 255 / kMaxMultiple;
        if (self.ballType == kRedBall) {
            [btn setBackgroundColor:COLOR(unit * numCount, 0, 0)];
        }else{
            [btn setBackgroundColor:COLOR( 0, 0,unit * numCount)];
        }

    }
}


@end
