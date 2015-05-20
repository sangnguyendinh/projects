#import "NSDictionary+SBJSONHelper.h"


@implementation NSDictionary (SBJSONHelper)

- (NSString*)uuidForKey:(id)key
{
	id obj = [self objectForKey:key];
	if ( obj && obj != [NSNull null] && [obj isKindOfClass:[NSNumber class]] )
		return [obj stringValue];
	if ( obj && obj != [NSNull null] && [obj isKindOfClass:[NSString class]] )
		return obj;
	return nil;
}

- (NSString*)stringForKey:(id)key
{
	id obj = [self objectForKey:key];
	if ( obj && obj != [NSNull null] && [obj isKindOfClass:[NSString class]] )
		return obj;
	return nil;
}

- (NSArray*)arrayForKey:(id)key
{
	id obj = [self objectForKey:key];
	if ( obj && obj != [NSNull null] && [obj isKindOfClass:[NSArray class]] )
		return obj;
	return nil;
}

- (NSDate*)dateForKey:(id)key
{
	id obj = [self objectForKey:key];
	return [DateTime convertToDateFromObject:obj];
}

- (NSDate*)serverDateForKey:(id)key
{
	id obj = [self objectForKey:key];
	return [DateTime convertToDateTimeFromServerObject:obj];
}

- (NSNumber*)numberForKey:(id)key
{
	id obj = [self objectForKey:key];
	if ( obj && obj != [NSNull null] && [obj isKindOfClass:[NSNumber class]] )
		return obj;
	return nil;
}

- (NSDictionary*)dictionaryForKey:(id)key
{
	id obj = [self objectForKey:key];
	if ( obj && obj != [NSNull null] && [obj isKindOfClass:[NSDictionary class]] )
		return obj;
	return nil;
}

@end
