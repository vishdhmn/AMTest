//
//  AMBaseCollectionViewCell.h
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface AMBaseCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) AMBundle *bundle;

-(void)configureForBundle:(AMBundle*)bundle;

@end
