//
//  AMBaseCollectionViewCell.m
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "AMBaseCollectionViewCell.h"

@implementation AMBaseCollectionViewCell

-(void)configureForBundle:(AMBundle *)bundle{
    [self layoutIfNeeded];
    self.bundle = bundle;
}

@end
