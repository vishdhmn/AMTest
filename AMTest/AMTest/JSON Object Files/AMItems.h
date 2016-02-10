//
//  AMItems.h
//
//  Created by vishal  on 10/02/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AMItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *webUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
