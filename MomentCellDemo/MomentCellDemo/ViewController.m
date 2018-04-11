//
//  ViewController.m
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/9.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import "ViewController.h"
#import "Moment.h"


@interface ViewController ()
{
	NSMutableArray *_data;
}


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_data = [NSMutableArray arrayWithArray:[Moment mockData]];
	
	CGFloat y = self.navigationController.navigationBar.bounds.size.height 
	+ UIApplication.sharedApplication.statusBarFrame.size.height;
	self.tableView.contentInset = UIEdgeInsetsMake(-y*1.5, 0, 0, 0);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	Moment *model = _data[indexPath.section];
	CellAdapter *adapter = model.cellAdapters[indexPath.row];
	return adapter.cellHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return _data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	Moment *model = _data[section];
	return model.cellAdapters.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	Moment *model = _data[indexPath.section];
	CellAdapter *adapter = model.cellAdapters[indexPath.row];
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(adapter.cellClass) forIndexPath:indexPath];
	[cell setValue:adapter.cellData forKey:@"data"];
	
	return cell;
}


@end
