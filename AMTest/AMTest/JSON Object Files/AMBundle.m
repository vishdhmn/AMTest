//
//  AMBundle.m
//
//  Created by vishal  on 10/02/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AMBundle.h"
#import "AMItems.h"


NSString *const kAMBundleLabel = @"label";
NSString *const kAMBundleItems = @"items";
NSString *const kAMBundleImage = @"image";
NSString *const kAMBundleTemplate = @"template";


@interface AMBundle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AMBundle

@synthesize label = _label;
@synthesize items = _items;
@synthesize image = _image;
@synthesize template = _template;


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
            self.label = [self objectOrNilForKey:kAMBundleLabel fromDictionary:dict];
    NSObject *receivedAMItems = [dict objectForKey:kAMBundleItems];
    NSMutableArray *parsedAMItems = [NSMutableArray array];
    if ([receivedAMItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAMItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAMItems addObject:[AMItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAMItems isKindOfClass:[NSDictionary class]]) {
       [parsedAMItems addObject:[AMItems modelObjectWithDictionary:(NSDictionary *)receivedAMItems]];
    }

    self.items = [NSArray arrayWithArray:parsedAMItems];
            self.image = [self objectOrNilForKey:kAMBundleImage fromDictionary:dict];
            self.template = [self objectOrNilForKey:kAMBundleTemplate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.label forKey:kAMBundleLabel];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kAMBundleItems];
    [mutableDict setValue:self.image forKey:kAMBundleImage];
    [mutableDict setValue:self.template forKey:kAMBundleTemplate];

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

    self.label = [aDecoder decodeObjectForKey:kAMBundleLabel];
    self.items = [aDecoder decodeObjectForKey:kAMBundleItems];
    self.image = [aDecoder decodeObjectForKey:kAMBundleImage];
    self.template = [aDecoder decodeObjectForKey:kAMBundleTemplate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_label forKey:kAMBundleLabel];
    [aCoder encodeObject:_items forKey:kAMBundleItems];
    [aCoder encodeObject:_image forKey:kAMBundleImage];
    [aCoder encodeObject:_template forKey:kAMBundleTemplate];
}

- (id)copyWithZone:(NSZone *)zone
{
    AMBundle *copy = [[AMBundle alloc] init];
    
    if (copy) {

        copy.label = [self.label copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
    }
    
    return copy;
}


@end
