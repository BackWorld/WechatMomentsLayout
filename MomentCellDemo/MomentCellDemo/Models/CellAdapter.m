//
//  CellAdapter.m
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import "CellAdapter.h"
#import <UIKit/UIKit.h>

@implementation CellAdapter

-(instancetype)init{
	if (self = [super init]) {
		_cellHeight = UITableViewAutomaticDimension;
	}
	return self;
}

+(instancetype)adapterWithCellClass: (Class)class cellData: (id)data{
	CellAdapter *item = [self new];
	
	item.cellClass = class;
	item.cellData = data;
	
	return item;
}

@end
