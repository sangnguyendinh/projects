#define kNumberOfSecondsInDay 86400

@interface DateTime : NSObject {}

// init calendar - needs to be called before using any of the other functions
+ (void)initCalendar;
+ (void)initUTCCalendar;

// date <-> date components conversion
+ (NSDateComponents*)timeOnlyComponentsFromDate:(NSDate*)date;
+ (NSDateComponents*)utcTimeOnlyComponentsFromDate:(NSDate*)date;
+ (NSDateComponents*)dateOnlyComponentsFromDate:(NSDate*)date;
+ (NSDateComponents*)componentsFromDate:(NSDate*)date;
+ (NSDate*)dateFromComponents:(NSDateComponents*)components;
+ (NSDate*)utcDateFromComponents:(NSDateComponents*)components;

// get date formatter string <-> date conversion
+ (NSDateFormatter*)dateFormatter;
+ (NSDateFormatter*)utcDateFormatter;
+ (NSDateFormatter*)shortStyleDateFormatterForTimeSlotId;

// get calendar
+ (NSCalendar*)gregorianCalendar;

// accept milliseconds from 1970 OR yyyy-MM-dd and returns date
+ (NSDate*)convertToDateFromObject:(id)obj;

// accept milliseconds from 1970 OR yyyy-MM-dd HH:mm:ss and returns date
+ (NSDate*)convertToDateTimeFromObject:(id)obj;

// accept milliseconds from 1970 OR yyyy-MM-dd and returns date
+ (NSDate*)convertToDateFromServerObject:(id)obj;

// accept milliseconds from 1970 OR yyyy-MM-dd HH:mm:ss and returns date
+ (NSDate*)convertToDateTimeFromServerObject:(id)obj;

// to convert local time before sending to server
+ (int64_t)convertToServerTransmitFormat:(NSDate*)date;

// compare 2 NSDates for equality considering only year, month, day
+ (BOOL)isEqualDateIgnoringTime:(NSDate*)date1 toDate:(NSDate*)date2;

// compare 2 NSDates for equality considering only hour and minute
+ (BOOL)isEqualTimeIgnoringDate:(NSDate*)time1 toTime:(NSDate*)time2;

// compare 2 NSDates and return NSComparisonResult
+ (NSComparisonResult)compareDateIgnoringTime:(NSDate*)time1 andTime2:(NSDate*)time2;

+ (NSDateComponents*)dateComponentsOfDifferenceIgnoringSeconds:(NSDate*)time1 andTime:(NSDate*)time2;

// returns grouped date NSString from an array of NSDates.
+ (NSString*)getGroupedDateStringFromDates:(NSArray*)dates dateFormat:(NSString*)format;

// Get string by format yyyy-MM-dd of date
+ (NSString*)getStringRequestAPIForDate:(NSDate*)date;

// Remove time from date
+ (NSDate*)dateFromRemoveTimeOfDate:(NSDate*)date;

+ (NSString*)getStringFromDate:(NSDate*)date withFormat:(NSString*)format;

@end
