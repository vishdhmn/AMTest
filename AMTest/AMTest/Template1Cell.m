//
//  Template1Cell.m
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "Template1Cell.h"

@implementation Template1Cell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configureForBundle:(AMBundle *)bundle{
    [super configureForBundle:bundle];
    if (self.bundle.items.count) {
        AMItems *item = [self.bundle.items objectAtIndex:0];
        [self.mainImg sd_setImageWithURL:[NSURL URLWithString:item.image] placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (!image)
                NSLog(@"Failed to load image %@", imageURL);
        }];
        
    }
}

@end
