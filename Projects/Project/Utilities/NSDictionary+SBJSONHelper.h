@interface NSDictionary (SBJSONHelper)
- (NSString*)uuidForKey:(id)key;
- (NSString*)stringForKey:(id)key;
- (NSArray*)arrayForKey:(id)key;
- (NSDate*)dateForKey:(id)key;
- (NSDate*)serverDateForKey:(id)key;
- (NSNumber*)numberForKey:(id)key;
- (NSDictionary*)dictionaryForKey:(id)key;
@end
