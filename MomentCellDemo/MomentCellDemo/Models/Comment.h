//
//  Comment.h
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Comment : NSObject

@property(nonatomic)NSInteger commentId;
@property(nonatomic, copy)NSString *text;
@property(nonatomic, strong)User *author;
@property(nonatomic, strong)User *toUser;

@end
