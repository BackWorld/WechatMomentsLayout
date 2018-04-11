//
//  MomentBaseCell.h
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomentBaseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarIV;
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;

@property(nonatomic,strong)id data;

@end
