//
//  HistoryCell.m
//  RandomNumber
//
//  Created by Peter on 13-7-12.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import "HistoryCell.h"
#import "BallView.h"
@implementation HistoryCell
/*
    这里用两种xib 加载方式 ，一种是直接在tableView中加 cell xib,一种是在cell init 中手动写入自定义view
 
 */

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        NSLog(@"========");
        self.numberLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40.0)]autorelease];
        [self addSubview: self.numberLabel];
        [_numberLabel release];
        
        self.ballView1 = [[[BallView alloc]initWithFrame:CGRectMake(60, 0, 40, 40) withTitle:@"33"]autorelease];
        [self addSubview:self.ballView1];
        _ballView1.touchType = kLongType;
        _ballView1.ballType = kRedBall;
        [_ballView1 release];
        
        
        self.ballView2 = [[[BallView alloc]initWithFrame:CGRectMake(120, 0, 40, 40) withTitle:@"23"]autorelease];
        [self addSubview:self.ballView2];
        [_ballView2 setBackgroundColor:[UIColor grayColor]];
        [_ballView2 release];

        NSLog(@"----");
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_numberLabel release];
    [_ballView1 release];
    [_ballView2 release];
    [_ballView3 release];
    [_ballView4 release];
    [_ballView5 release];
    [_ballView6 release];
    [super dealloc];
}
@end
