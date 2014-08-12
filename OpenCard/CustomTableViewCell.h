//
//  CustomTableViewCell.h
//  OpenCard
//
//  Created by Tauqeer Ahmed on 8/11/14.
//  Copyright (c) 2014 Merrycode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"


@interface CustomTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet AsyncImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;

@end
