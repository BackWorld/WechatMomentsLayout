//
//  Moment.m
//  MomentCellDemo
//
//  Created by zhuxuhong on 2018/4/10.
//  Copyright © 2018年 GuessMe. All rights reserved.
//

#import "Moment.h"
#import "Moment+AdapterMaker.h"


@implementation Moment

#pragma mark - Init
-(instancetype)init{
	if (self = [super init]) {
		_cellAdapters = [NSMutableArray new];
	}
	return self;
}

+(instancetype)momentWithDictionary: (NSDictionary*)dict{
	Moment *m = [self new];
	[m setValuesForKeysWithDictionary:dict];
	return m;
}

#pragma mark - KVC
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
	
}

-(void)setValue:(id)value forKey:(NSString *)key{
	if ([key isEqualToString:@"type"]) {
		switch ([value integerValue]) {
			case 1:
				_type = MomentTypeUserShareLink;
				break;
			case 2:
				_type = MomentTypeAdvertisement;
				break;
			default:
				_type = MomentTypeUserComposition;
				break;
		}
	}
	else{
		[super setValue:value forKey:key];
	}
}

#pragma mark - Sample Data
+(NSArray *)mockData{
	NSString *file = [NSBundle.mainBundle pathForResource:@"moments.json" ofType:nil];
	NSData *data = [NSData dataWithContentsOfFile:file];
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
	NSArray *dataArray = dict[@"data"];
	NSMutableArray *list = [NSMutableArray new];
	for (NSDictionary *dict in dataArray) {
		Moment *item = [self momentWithDictionary:dict];
		[item makeDataAdapter];
		[list addObject:item];
	}
	
	return list;
}


@end
