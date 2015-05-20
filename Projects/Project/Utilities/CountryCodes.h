#import <Foundation/Foundation.h>

#define kCountryName 0
#define kCountryPhone 1

@interface CountryCodes : NSObject
{
    NSDictionary *countriesDict_;
	NSArray	*orderedCodes_;
}

+(CountryCodes *) shareCountryCodes;

-(NSDictionary *) countriesDict;
-(NSArray *) orderedCodes;

-(NSString *) currentPhone;
-(NSString *) getCountryCodeFrom:(NSString *) phoneStr;

- (NSMutableArray *) getArrayFromCountriesDict;

@end
