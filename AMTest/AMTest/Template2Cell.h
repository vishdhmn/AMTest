//
//  Template2Cell.h
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "AMBaseCollectionViewCell.h"
#import "AMInnerCollection.h"

@interface Template2Cell : AMBaseCollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet AMInnerCollection *cellCollection;

@end
