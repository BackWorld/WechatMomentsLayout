//
//  CellAdapter.h
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellAdapter : NSObject

@property(nonatomic)Class cellClass;
@property(nonatomic)float cellHeight;
@property(nonatomic,strong)id cellData;

+(instancetype)adapterWithCellClass: (Class)class cellData: (id)data;

@end
