//
//  TableViewInterceptor.h
//  TableViewSample
//
//  Created by 小林堂太 on 2014/07/06.
//  Copyright (c) 2014年 dota.kobayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewInterceptor : NSObject

@property (nonatomic, readwrite, weak) id receiver;
@property (nonatomic, readwrite, weak) id middleMan;

@end
