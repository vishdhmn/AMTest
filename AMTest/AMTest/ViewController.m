//
//  ViewController.m
//  AMTest
//
//  Created by vishal on 10/02/16.
//  Copyright © 2016 vishal. All rights reserved.
//

#import "ViewController.h"
#import "DataModels.h"
#import "AMBaseCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *bundleCollection;
@property (nonatomic, strong) NSArray *bundlesList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@\n**************\n%@", [self file1Content], [self file2Content]);
    
    NSMutableArray* data1 = [NSJSONSerialization JSONObjectWithData:[[self file1Content] dataUsingEncoding:NSUTF8StringEncoding]
                                           options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers
                                             error:nil];
    
    
    NSMutableArray* data2 = [NSJSONSerialization JSONObjectWithData:[[self file2Content] dataUsingEncoding:NSUTF8StringEncoding]
                                                                 options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers
                                                                   error:nil];
    self.bundlesList = data1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString*)file1Content{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"f_one"
                                                     ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    return content;
}

-(NSString*)file2Content{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"f_two"
                                                     ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    return content;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.bundlesList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AMBundle *bundle = [AMBundle modelObjectWithDictionary:[self.bundlesList objectAtIndex:indexPath.row]];
    NSString *identifier  = bundle.template?:@"product-template-1";
    
    AMBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [cell configureForBundle:bundle];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    CGFloat width = self.bundleCollection.frame.size.width - 20;
    return CGSizeMake(width, width*(200.0/450.0));
}

@end






