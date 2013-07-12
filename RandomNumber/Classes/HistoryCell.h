//
//  HistoryCell.h
//  RandomNumber
//
//  Created by Peter on 13-7-12.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BallView;
@interface HistoryCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *numberLabel;
@property (retain, nonatomic) IBOutlet BallView *ballView1;
@property (retain, nonatomic) IBOutlet BallView *ballView2;
@property (retain, nonatomic) IBOutlet BallView *ballView3;
@property (retain, nonatomic) IBOutlet BallView *ballView4;
@property (retain, nonatomic) IBOutlet BallView *ballView5;
@property (retain, nonatomic) IBOutlet BallView *ballView6;


@end
