//
//  Moment.h
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Comment.h"
#import "Location.h"
#import "CellAdapter.h"

typedef enum : NSUInteger {
	MomentTypeUserComposition = 0, // 用户编写
	MomentTypeUserShareLink = 1, // 用户分享
	MomentTypeAdvertisement = 2, // 广告商
} MomentType;




@interface Moment : NSObject

// 类型
@property(nonatomic)MomentType type;
// id
@property(nonatomic)NSInteger momentId;
// 私密
@property(nonatomic)BOOL isPrivate;
// 创建用户
@property(nonatomic, strong)User *author;
// 位置
@property(nonatomic, strong)Location *location;
// 创建日期
@property(nonatomic, strong)NSDate *date;
// 文字内容
@property(nonatomic, copy)NSString *text;
// 视频链接
@property(nonatomic, copy)NSString *videoUrl;
// 分享链接
@property(nonatomic, copy)NSString *linkUrl;
// 图片列表
@property(nonatomic, copy)NSArray *images;
// 喜欢列表
@property(nonatomic, copy)NSMutableArray<User *> *likes;
// 评论列表
@property(nonatomic, copy)NSMutableArray<Comment *> *comments;
// 提醒谁看
@property(nonatomic, copy)NSMutableArray<User *> *includeUsers;
// 不给谁看
@property(nonatomic, copy)NSMutableArray<User *> *excludeUsers;

// 数据封装
@property(nonatomic, strong)NSMutableArray<CellAdapter *> *cellAdapters;

+(NSArray*)mockData;

@end
