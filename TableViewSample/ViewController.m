//
//  ViewController.m
//  TableViewSample
//
//  Created by 小林堂太 on 2014/07/06.
//  Copyright (c) 2014年 dota.kobayashi. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "ShopTableView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet ShopTableView *tableView;

/**
 テーブルに表示する情報が入ります。
 */
@property NSMutableArray *mDataSource;
@property (nonatomic, strong) NSArray *dataSourceiPhone;

@end

@implementation ViewController

//アラート画面のタグを宣言
static const NSInteger firstAlertTag = 1;
static const NSInteger secondAlertTag = 2;
NSTimer *myTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // デリゲートメソッドをこのクラスで実装する
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // テーブルに表示したいデータソースをセット
    self.dataSourceiPhone = @[@"shop1", @"shop2", @"shop3", @"shop4", @"shop5", @"shop6", @"shop7", @"shop8", @"shop9", @"shop10"];
    
    // カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithNibName:@"TableViewCustomCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    [self.searchDisplayController.searchResultsTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    myTimer =
    [NSTimer scheduledTimerWithTimeInterval:0.1f //タイマーを発生させる間隔
                                     target:self //タイマー発生時に呼び出すメソッドがあるターゲット
                                   selector:@selector(timerCall:) //タイマー発生時に呼び出すメソッド
                                   userInfo:nil //selectorに渡す情報(NSDictionary)
                                    repeats:YES //リピート
     ];
    
    UIAlertView *firstAlert = [[UIAlertView alloc] initWithTitle:@"AlertView"
                                                        message:@"とめる"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"stop", nil];
    firstAlert.tag = firstAlertTag;
    [firstAlert show];

}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == firstAlertTag)
    {
        [self otherButtonPushed];
    }
    else if (alertView.tag == secondAlertTag)
    {
        // 特になにもなし
    }
}

- (void)otherButtonPushed
{
    [myTimer invalidate];
    
    // 余韻を持たす
    CGPoint point = CGPointMake(0, self.tableView.contentOffset.y - 300);
    [self.tableView setContentOffset:point animated:YES];
 
    
    // 止まる位置の店を取得 現在のスクロール位置をセルの高さで割って対象のセルを取得する
    NSInteger idx = self.tableView.contentOffset.y / 80;
    NSString *name = self.dataSourceiPhone[idx];
    
    UIAlertView *secondAlert = [[UIAlertView alloc] initWithTitle:@"AlertView"
                                                        message:name
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    secondAlert.tag = secondAlertTag;
    [secondAlert show];
    
}

-(void)timerCall:(NSTimer*)timer
{
    CGPoint point = CGPointMake(0, self.tableView.contentOffset.y - 300);
    [self.tableView setContentOffset:point animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceiPhone.count;
}

/**
 テーブルに表示するセクション（区切り）の件数を返します。（オプション）
 
 @return NSInteger : セクションの数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 *  テーブルに表示するセルを返します。
 *
 *  @param tableView テーブルビュー
 *  @param indexPath セクション番号・行番号の組み合わせ
 *
 *  @return セル
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.shopImage.image = [UIImage imageNamed:@"ios1-100x100"];
    cell.shopName.text = self.dataSourceiPhone[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomTableViewCell rowHeight];
}

@end
