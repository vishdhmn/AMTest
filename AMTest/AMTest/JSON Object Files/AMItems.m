//
//  AMItems.m
//
//  Created by vishal  on 10/02/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AMItems.h"


NSString *const kAMItemsLabel = @"label";
NSString *const kAMItemsImageUrl = @"image_url";
NSString *const kAMItemsImage = @"image";
NSString *const kAMItemsWebUrl = @"web-url";


@interface AMItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AMItems

@synthesize label = _label;
@synthesize imageUrl = _imageUrl;
@synthesize image = _image;
@synthesize webUrl = _webUrl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.label = [self objectOrNilForKey:kAMItemsLabel fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kAMItemsImageUrl fromDictionary:dict];
            self.image = [self objectOrNilForKey:kAMItemsImage fromDictionary:dict];
            self.webUrl = [self objectOrNilForKey:kAMItemsWebUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.label forKey:kAMItemsLabel];
    [mutableDict setValue:self.imageUrl forKey:kAMItemsImageUrl];
    [mutableDict setValue:self.image forKey:kAMItemsImage];
    [mutableDict setValue:self.webUrl forKey:kAMItemsWebUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.label = [aDecoder decodeObjectForKey:kAMItemsLabel];
    self.imageUrl = [aDecoder decodeObjectForKey:kAMItemsImageUrl];
    self.image = [aDecoder decodeObjectForKey:kAMItemsImage];
    self.webUrl = [aDecoder decodeObjectForKey:kAMItemsWebUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_label forKey:kAMItemsLabel];
    [aCoder encodeObject:_imageUrl forKey:kAMItemsImageUrl];
    [aCoder encodeObject:_image forKey:kAMItemsImage];
    [aCoder encodeObject:_webUrl forKey:kAMItemsWebUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    AMItems *copy = [[AMItems alloc] init];
    
    if (copy) {

        copy.label = [self.label copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.webUrl = [self.webUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
