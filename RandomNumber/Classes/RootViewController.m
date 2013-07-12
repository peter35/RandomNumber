//
//  RootViewController.m
//  RandomNumber
//
//  Created by Peter on 13-6-24.
//  Copyright (c) 2013年 Peter. All rights reserved.
//

#import "RootViewController.h"
#import "UserInfoData.h"
#import "HistoryData.h"

#import "BallView.h"
#import "DetailTextView.h"
#import "HistoryCell.h"

@interface RootViewController (){
    UserInfoData * userInfo;
    HistoryData * history1;
//    HistoryData * history2;
//    HistoryData * history3;

}




@end



#define MaxNum 35
#define RedCount 5
#define BlueCount 2




@implementation RootViewController



#pragma mark - Life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    userInfo = [[UserInfoData alloc]init];
    userInfo.gDate = @"1987-03-05";
    userInfo.nDate = @"1987-02-06";
    userInfo.sSex = @"1";
    userInfo.xingzuoType = kShuangyu;
    
    //13070 9 12 18 21 29 1 8
    //13071 13  19 26 27 28 3  11
    //13072 12  27 28 33 35 3 5
    
    
//    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:kType,kDaletou,kIssue,@"2013099",kData,@"3,6,14,23,25,3,6", nil];
    
    history1 = [[HistoryData alloc]initWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",kDaletou],@"type",@"2013099",@"issue",@"3,6,14,23,25,3,6", @"data",nil]];


    BallView * ball1 = [[BallView alloc]initWithFrame:CGRectMake(100, 100, 40, 40) withTitle:@"35"];
    [ball1 setBackgroundColor:[UIColor grayColor]];
    ball1.touchType = kSwitchType;
    ball1.ballType = kRedBall;
    [self.view addSubview:ball1];
    [ball1 release];

    BallView * ball2 = [[BallView alloc]initWithFrame:CGRectMake(100 + 60, 100, 40, 40) withTitle:@"25"];
    [ball2 setBackgroundColor:[UIColor grayColor]];
    ball2.touchType = kSwitchType;
    ball2.ballType = kBlueBall;
    [self.view addSubview:ball2];
    [ball2 release];
    
    
    BallView * ball3 = [[BallView alloc]initWithFrame:CGRectMake(100 + 120, 100, 40, 40) withTitle:@"15"];
    [ball3 setBackgroundColor:[UIColor grayColor]];
    ball3.touchType = kLongType;
    ball3.ballType = kRedBall;
    [self.view addSubview:ball3];
    [ball3 release];
    
    
    DetailTextView *label = [[DetailTextView alloc]initWithFrame:CGRectMake(0, 240, 320, 60)];
    [label setText:@"abcdefghijklmnopqrstuvwxyz" WithFont:[UIFont systemFontOfSize:17] AndColor:[UIColor blackColor]];
    [label setKeyWordTextArray:[NSArray arrayWithObjects:@"a",@"d",@"f",@"c",@"w", nil] WithFont:[UIFont fontWithName:@"AcademyEngravedLetPlain" size:25] AndColor:[UIColor blueColor]];
    [label setKeyWordTextArray:[NSArray arrayWithObjects:@"b",@"e",@"g",@"q",@"z", nil] WithFont:[UIFont fontWithName:@"SnellRoundhand" size:35] AndColor:[UIColor redColor]];
    [self.view addSubview:label];
    [label release];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"root:dealloc");
    [userInfo release];
    [history1 release];
    [_randomBtn release];
    [_resultLabel release];
    [_myTableView release];
    [_theTableView release];
    [super dealloc];
}
#pragma mark - Private
/*
 根据已知数据产生随机数
 先由用户数据产生基本数据，再产生拓展数据，产生两个数据池
 
*/


-(NSArray *)getMoreData:(NSString *)sData{
    NSMutableArray * mArr = [NSMutableArray array];
    NSInteger num = [sData integerValue];
    if (num == 4 || num == 7 || num == 11) {
        [mArr addObjectsFromArray:[self getMoreDataFromSpecial:sData]];
    }
    else{
        [mArr addObjectsFromArray:[self getMoreDataFromOther:sData]];
    }
    return (NSArray *)mArr;
}


//拓展数据
-(NSArray *)getMoreDataFromSpecial:(NSString *)sData{
    
    NSMutableArray * mArr = [NSMutableArray array];
    
    if ([sData integerValue] == 4) {
        [mArr addObject:@"4"];
        [mArr addObject:@"8"];
        [mArr addObject:@"12"];
        [mArr addObject:@"14"];
        [mArr addObject:@"16"];
        [mArr addObject:@"20"];
        [mArr addObject:@"24"];
        [mArr addObject:@"28"];
        [mArr addObject:@"32"];
        
    }
    else if([sData integerValue] == 7){
        [mArr addObject:@"7"];
        [mArr addObject:@"14"];
        [mArr addObject:@"17"];
        [mArr addObject:@"21"];
        [mArr addObject:@"27"];
        [mArr addObject:@"28"];
    }
    else if([sData integerValue] == 11){
        [mArr addObject:@"11"];
        [mArr addObject:@"22"];
        [mArr addObject:@"33"];
    }
    
    
    return (NSArray *)mArr;
}

-(NSArray *)getMoreDataFromOther:(NSString *)sData{
    NSMutableArray * mArr = [NSMutableArray array];
    if ([sData length] > 1) {
        NSString * sTemp = [sData substringWithRange:NSMakeRange(sData.length -1, 1)];
        for (int i = 0; i < 3; i++) {
            NSInteger iTemp = 10*i+sTemp.integerValue;
            if (iTemp <= MaxNum) {
                [mArr addObject:[NSString stringWithFormat:@"%d",iTemp]];
            }
        }
    }else{
        for (int j = 0; j < 3; j++) {
            NSInteger jTemp = 10*j + sData.integerValue;
            if (jTemp <= MaxNum) {
                [mArr addObject:[NSString stringWithFormat:@"%d",jTemp]];
            }
        }
    }
    
    return (NSArray *)mArr;

}


/*
 根据历史数据产生随机数

 */

-(NSArray *)getHistoryRedDataFromOne:(HistoryData *)hData{
    /*
       3,6,14,23,25,3,6

     */
    NSMutableArray * mArr = [NSMutableArray array];

    if (hData.lotteryType == kDaletou) {
        NSArray * arr = [[NSArray alloc]initWithObjects:hData.num1, hData.num2, hData.num3, hData.num4, hData.num5, nil];
        for (id obj in arr) {
            
        }
        [arr release];

    }else{
        
    }
    return (NSArray *)mArr;
}


-(void)getHistoryBlueDataFromOne:(HistoryData *)hData{
//    NSArray * arr = [[NSArray alloc]initWithObjects:hData.num6,hData.num7, nil];

}

/*
    去重，排序
 
 NSComparisonResult
 
 NSOrderedSame
 */
-(NSArray *)getArrayWithoutSameData:(NSArray *)arr{
    return [[NSSet setWithArray:arr] allObjects];// dict 也可以
}

-(NSArray *)sorteArray:(NSArray *)arr{
    NSArray *sortedArray = [arr sortedArrayUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return sortedArray;
}



/*
    杀掉数据
 */



/*
    产生结果
 */
- (IBAction)makeRandomNumber:(id)sender {
    
    NSArray * arr = [[NSArray alloc]initWithObjects:history1.num1,history1.num2,history1.num3,history1.num4,history1.num5, nil];
    NSMutableArray * mArr = [NSMutableArray array];
    for (id obj in arr) {
        if (![obj isKindOfClass:[NSString class]]) {
            continue;
        }
        [mArr addObjectsFromArray:[self getMoreData:obj]];
    }

    NSArray * lastArr = [NSArray  arrayWithArray:[self getArrayWithoutSameData:mArr]];
    NSLog(@"%@",lastArr);

    
    //
    NSMutableArray  * rArr = [NSMutableArray array];
    for (int i = 0; i < RedCount; i++) {
        NSString * randNum = [mArr objectAtIndex:arc4random()%lastArr.count];
        if (rArr.count == 0) {
            [rArr addObject:randNum];
            continue;
        }
        NSArray * tem = [NSArray arrayWithArray:rArr];
        int count = 0;
        for (id obj in tem) {
            count++;
            if ([randNum isEqualToString:obj]) {
                i--;
                break;
            }else{
                if (count == tem.count) {
                    [rArr addObject:randNum];
                }
            }
        }
    }


    NSMutableString * result = [NSMutableString string];
    NSArray * resultArr = [self sorteArray:rArr];
    if (resultArr.count>0) {
        for (int j = 0; j<RedCount; j++) {
            [result appendFormat:@"%@,",[resultArr  objectAtIndex:j]];
        }
    }

    NSLog(@"result: %@",result);
    self.resultLabel.text = result;
    [arr release];
}





#pragma mark - TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:self.theTableView]) {
        static NSString * cellInfo = @"cellInfo";
        HistoryCell * cell = [tableView dequeueReusableCellWithIdentifier:cellInfo];
        if (cell == nil) {
            cell = [[[HistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfo]autorelease];
//            [cell.contentView setBackgroundColor:[UIColor grayColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        return cell;
        
    }else{
        HistoryCell * cell = nil;//[tableView dequeueReusableCellWithIdentifier:@"cell"]; //已在xib 中添加
        if (cell == nil) {
            NSArray * nib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([HistoryCell class]) owner:self options:nil];
            cell = [nib lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            NSLog(@"%@",[cell.contentView subviews]);
            
        }
        for (id view in [cell.contentView subviews]) {
            if ([view isKindOfClass:[BallView class]]) {
                [view setBackgroundColor:[UIColor grayColor]];
//                NSLog(@"%@",[view subviews]);
            }
        }
        cell.numberLabel.text = @"123213";
        return cell;
    }
    

    
}










@end
