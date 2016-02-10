//
//  Template2InnerCell.m
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "Template2InnerCell.h"

@implementation Template2InnerCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configureForItems:(AMItems *)item{
    [self layoutIfNeeded];
    self.item = item;
    NSURL *imgUrl = [NSURL URLWithString:item.imageUrl?:item.image];
    [self.productImg sd_setImageWithURL:imgUrl  placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!image) {
        }
    }];
    self.productName.text = item.label?:@"N/A";
}

@end
