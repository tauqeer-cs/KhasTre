//
//  Product.h
//  OpenCard
//
//  Created by Tauqeer Ahmed on 8/8/14.
//  Copyright (c) 2014 Merrycode. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic,strong) NSString * location;
@property (nonatomic,strong) NSString * name;
@property (nonatomic) int quantity;
@property (nonatomic) int stockStatusId;
@property (nonatomic,strong) NSString *imageLink;
@property (nonatomic,strong) NSString *model;
@property (nonatomic) int manufacturerId;
@property (nonatomic) int shipping;
@property (nonatomic,strong) NSString  *price;
@property (nonatomic) int points;

@end
