//
//  Moment+AdapterMaker.m
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/11.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import "Moment+AdapterMaker.h"
#import "MomentTextCell.h"
#import "MomentShareLinkCell.h"
#import "MomentAdCell.h"
#import "MomentFooterCell.h"
#import "MomentLikeItemCell.h"
#import "MomentCommentItemCell.h"
#import "MomentImagesCell.h"
#import "MomentShowLocationCell.h"

@implementation Moment (AdapterMaker)

// 图片/视频
-(CellAdapter *)imagesDataAdapter{
	if (self.images.count == 0) {
		return nil;
	}
	return [CellAdapter adapterWithCellClass:[MomentImagesCell class] cellData: self.images];
}

// 点赞
-(CellAdapter *)likesDataAdapter{
	if (self.likes.count == 0) {
		return nil;
	}
	return [CellAdapter adapterWithCellClass:[MomentLikeItemCell class] cellData:nil];
}

// 评论列表
-(NSArray<CellAdapter *> *)commentsDataAdapters{
	if (self.comments.count == 0) {
		return nil;
	}
	NSMutableArray *array = [NSMutableArray new];
	for (id comment in self.comments) {
		id m = [CellAdapter adapterWithCellClass:[MomentCommentItemCell class] cellData:comment];
		[array addObject:m];
	}
	return array;
}

// 显示位置
-(CellAdapter *)showLocationDataAdapter{
	if (self.location == nil) {
		return nil;
	}
	CellAdapter *model = [CellAdapter adapterWithCellClass:[MomentShowLocationCell class] cellData: self.location];
	model.cellHeight = 30;
	return model;
}

// 信息脚
-(CellAdapter *)footerDataAdapter{
	if (self.isPrivate) {
		return nil;
	}
	CellAdapter *model = [CellAdapter adapterWithCellClass:[MomentFooterCell class] cellData: nil];
	model.cellHeight = 44;
	return model;
}

// 信息交互
-(void)makeInteractionDataAdapters{
	id footer = [self footerDataAdapter];
	id likes = [self likesDataAdapter];
	NSArray *comments = [self commentsDataAdapters];
	if (footer) {
		[self.cellAdapters addObject:footer];
	}
	if (likes) {
		[self.cellAdapters addObject:likes];
	}
	if (comments) {
		[self.cellAdapters addObjectsFromArray:comments];
	}
}

-(void)makeAdvertisementDataAdapter{
	CellAdapter *adapter = [CellAdapter adapterWithCellClass:[MomentAdCell class] cellData:nil];
	adapter.cellHeight = 290;
	
	[self makeInteractionDataAdapters];
	
	[self.cellAdapters insertObject:adapter atIndex:0];
}

-(void)makeUserShareLinkDataAdapter{
	CellAdapter *adapter = [CellAdapter adapterWithCellClass:[MomentShareLinkCell class] cellData:nil];
	
	[self makeInteractionDataAdapters];
	
	[self.cellAdapters insertObject:adapter atIndex:0];
}

-(void)makeUserCompsitionDataAdapter{
	CellAdapter *adapter = [CellAdapter adapterWithCellClass:[MomentTextCell class] cellData:nil];
	
	id images = [self imagesDataAdapter];
	id location = [self showLocationDataAdapter];
	if (images) {
		[self.cellAdapters addObject:images];
	}
	if (location) {
		[self.cellAdapters addObject:location];
	}
	
	[self makeInteractionDataAdapters];
	
	[self.cellAdapters insertObject:adapter atIndex:0];
}

-(void)makeDataAdapter{
	switch (self.type) {
		case MomentTypeAdvertisement:
			[self makeAdvertisementDataAdapter];
			break;
			
		case MomentTypeUserShareLink:
			[self makeUserShareLinkDataAdapter];
			break;
			
		default:
			[self makeUserCompsitionDataAdapter];
			break;
	}
}


@end
