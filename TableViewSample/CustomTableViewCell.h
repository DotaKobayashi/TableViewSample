//
//  CustomTableViewCell.h
//  TableViewSample
//
//  Created by 小林堂太 on 2014/07/06.
//  Copyright (c) 2014年 dota.kobayashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *shopName;

+ (CGFloat)rowHeight;

@end
