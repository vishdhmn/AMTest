//
//  Template3Cell.m
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "Template3Cell.h"

@implementation Template3Cell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configureForBundle:(AMBundle *)bundle{
    [super configureForBundle:bundle];
    
    for (UIView *view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x=0, y=0, width = self.scrollView.frame.size.width, height = self.scrollView.frame.size.height;
    if (bundle.items.count) {
        self.pageControl.numberOfPages = bundle.items.count;
        [self.pageControl setCurrentPage:0];
        for (AMItems *item in [self.bundle items]) {
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            [self.scrollView addSubview:image];
            NSURL *imgUrl = [NSURL URLWithString:item.imageUrl?:item.image];
            if (!imgUrl) {
                NSLog(@"Unable to get imageurl: %@", item.imageUrl?:item.image);
            }
            image.contentMode = UIViewContentModeScaleAspectFill;
            [image sd_setImageWithURL:imgUrl  placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (!image) {
                }
            }];
            x += width;
        }

    }else{
        self.pageControl.numberOfPages = 0;
    }
    
    [self.scrollView setContentSize:CGSizeMake(x, height)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x/pageWidth;
    NSInteger index = page<0?0:page>=self.pageControl.numberOfPages?self.pageControl.numberOfPages-1:page;
    [self.pageControl setCurrentPage:index];
    
}
@end
