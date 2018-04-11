//
//  User.h
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic)NSInteger userId;
@property(nonatomic, copy)NSString *nickName;
@property(nonatomic, copy)NSString *avatarUrl;

@end
