//
//  RootViewController.h
//  RandomNumber
//
//  Created by Peter on 13-6-24.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *theTableView;
@property (retain, nonatomic) IBOutlet UITableView *myTableView;
@property (retain, nonatomic) IBOutlet UIButton *randomBtn;
@property (retain, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)makeRandomNumber:(id)sender;

@end
