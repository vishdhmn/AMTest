//
//  AMBundle.h
//
//  Created by vishal  on 10/02/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AMBundle : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *template;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
