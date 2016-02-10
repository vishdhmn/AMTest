//
//  Template2Cell.m
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "Template2Cell.h"
#import "AMInnerCollection.h"
#import "Template2InnerCell.h"

@implementation Template2Cell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configureForBundle:(AMBundle *)bundle{
    [super configureForBundle:bundle];
    [self.cellCollection reloadData];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.bundle?self.bundle.items.count:0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AMItems *item = [self.bundle.items objectAtIndex:indexPath.row];
    Template2InnerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"product" forIndexPath:indexPath];
    [cell configureForItems:item];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    CGFloat height = self.cellCollection.frame.size.height;
    return CGSizeMake(height * (155.0/200.0), height);
}


@end
