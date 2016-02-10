//
//  Template2InnerCell.h
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "AMBaseCollectionViewCell.h"

@interface Template2InnerCell : AMBaseCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (nonatomic, strong) AMItems* item;
-(void)configureForItems:(AMItems*)item;

@end
