#import "DateTime.h"

NSCalendar *gregCalendar = nil;
NSCalendar *utcGregCalendar = nil;

const NSUInteger kTimeOnlyCalendarUnit = (NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
const NSUInteger kDateOnlyCalendarUnit = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit);
const NSUInteger kAllCalendarUnit      = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
                                          NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit);

NSDateFormatter *dateFormatter ;
NSDateFormatter *utcDateFormatter ;
NSDateFormatter *shortStyleDateFormatterForTimeSlotId ;

@implementation DateTime

+ (void)initCalendar
{
	if (!gregCalendar)
		gregCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

+ (void)initUTCCalendar
{
	if (!utcGregCalendar){
		utcGregCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		utcGregCalendar .timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
	}
}

+ (NSDateComponents*)timeOnlyComponentsFromDate:(NSDate*)date
{
	if(!date )return nil;
	
	if (!gregCalendar)[self initCalendar];
	
	return [gregCalendar components:kTimeOnlyCalendarUnit fromDate:date];
}

+ (NSDateComponents*)utcTimeOnlyComponentsFromDate:(NSDate*)date
{
	if(!date )return nil;
	
	if (!utcGregCalendar)[self initUTCCalendar];
	
	return [utcGregCalendar components:kTimeOnlyCalendarUnit fromDate:date];
}

+ (NSDateComponents*)dateOnlyComponentsFromDate:(NSDate*)date
{
	if(!date )return nil;
	
	if (!gregCalendar)[self initCalendar];
	
	return [gregCalendar components:kDateOnlyCalendarUnit fromDate:date];
}

+ (NSDateComponents*)componentsFromDate:(NSDate*)date
{
	if(!date )return nil;
	
	if (!gregCalendar)[self initCalendar];
	
	return [gregCalendar components:kAllCalendarUnit fromDate:date];
}

+ (NSDate*)dateFromComponents:(NSDateComponents*)components
{
	if (!gregCalendar)[self initCalendar];
	
	return [gregCalendar dateFromComponents:components];
}

+ (NSDate*)utcDateFromComponents:(NSDateComponents*)components
{
	if(!utcGregCalendar)[self initUTCCalendar];
	
	return [utcGregCalendar dateFromComponents:components];
}

+ (NSDateFormatter*)dateFormatter
{
	if (!dateFormatter){
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[NSLocale autoupdatingCurrentLocale]];
	}
	
	return dateFormatter ;
}

+ (NSDateFormatter*)utcDateFormatter
{
	if (!utcDateFormatter){
		utcDateFormatter = [[NSDateFormatter alloc] init];
		[utcDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	}
	
	return utcDateFormatter ;
}

+ (NSDateFormatter*)shortStyleDateFormatterForTimeSlotId
{
	if(!shortStyleDateFormatterForTimeSlotId){
		shortStyleDateFormatterForTimeSlotId = [[NSDateFormatter alloc] init];
		[shortStyleDateFormatterForTimeSlotId setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
		[shortStyleDateFormatterForTimeSlotId setTimeStyle:NSDateFormatterShortStyle];
	}
	return shortStyleDateFormatterForTimeSlotId ;
}

+ (NSCalendar*)gregorianCalendar
{
	if (!gregCalendar)[self initCalendar];
	
	return gregCalendar ;
}

+ (NSDate*)convertToDateFromObject:(id)obj
{
	// When we send time as string to the server, it is interpreted as GMT time. So when the server returns
	// it to us, it is offset from the intended time by whatever our time offset is. Hence we need
	// to subtract our time offset from it.
    // e.g. when we send 1200GMT+8 to server, it is stored as 1200GMT on server,
    //      when we retrieve it from server in numeric format, it becomes 1200GMT (2000GMT+8)if we don't subtract
    //      when we retrieve it from server in string format, it will be exactly as we sent it
	if ([obj isKindOfClass:[NSNumber class]] ){
		NSDate *utcTime = [NSDate dateWithTimeIntervalSince1970:[obj doubleValue]/1000];
		NSDate *offsetTime = [utcTime dateByAddingTimeInterval:-[[NSTimeZone defaultTimeZone] secondsFromGMT]];
		return offsetTime;
	}
	else if ([obj isKindOfClass:[NSString class]] ){
		[[self dateFormatter] setDateFormat:@"yyyy-MM-dd"];
		return [[self dateFormatter] dateFromString:obj];
	}
    
	return nil;
}

+ (NSDate*)convertToDateTimeFromObject:(id)obj
{
	// When we send time as string to the server, it is interpreted as GMT time. So when the server returns
	// it to us, it is offset from the intended time by whatever our time offset is. Hence we need
	// to subtract our time offset from it.
    // e.g. when we send 1200GMT+8 to server, it is stored as 1200GMT on server,
    //      when we retrieve it from server in numeric format, it becomes 1200GMT (2000GMT+8)if we don't subtract
    //      when we retrieve it from server in string format, it will be exactly as we sent it
	if ([obj isKindOfClass:[NSNumber class]] ){
		NSDate *utcTime = [NSDate dateWithTimeIntervalSince1970:[obj doubleValue]/1000];
		NSDate *offsetTime = [utcTime dateByAddingTimeInterval:-[[NSTimeZone defaultTimeZone] secondsFromGMT]];
		return offsetTime;
	}
	else if ([obj isKindOfClass:[NSString class]] ){
		[[self dateFormatter] setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
		return [[self dateFormatter] dateFromString:obj];
	}
	return nil;
}

+ (NSDate*)convertToDateFromServerObject:(id)obj
{
	// Server generated times are in GMT.
    // e.g. server generates and stores 1200GMT,
    //      when we retrieve it from server in numeric format, it becomes 2000GMT+8
    //      when we retrieve it from server in string format, we need to apply our offset to it else it becomes 0400GMT (1200GMT+8).
	if ([obj isKindOfClass:[NSNumber class]] ){
		return [NSDate dateWithTimeIntervalSince1970:[obj doubleValue]/1000];
	}
	else if ([obj isKindOfClass:[NSString class]] ){
		[[self utcDateFormatter] setDateFormat:@"yyyy-MM-dd"];
		return [[self utcDateFormatter] dateFromString:obj];
	}
	return nil;
}

+ (NSDate*)convertToDateTimeFromServerObject:(id)obj
{
	// Server generated times are in GMT.
    // e.g. server generates and stores 1200GMT,
    //      when we retrieve it from server in numeric format, it becomes 2000GMT+8
    //      when we retrieve it from server in string format, we need to apply our offset to it else it becomes 0400GMT (1200GMT+8).
	if ([obj isKindOfClass:[NSNumber class]] ){
		return [NSDate dateWithTimeIntervalSince1970:[obj doubleValue]/1000];
	}
	else if ([obj isKindOfClass:[NSString class]] ){
		[[self utcDateFormatter] setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
		return [[self utcDateFormatter] dateFromString:obj];
	}
	return nil;
}

+ (int64_t)convertToServerTransmitFormat:(NSDate*)date
{
    // add our GMT offset so GMT time on server is same as local time
    // e.g. 1200GMT+8(0400GMT)on device becomes 1200GMT on server
    return ([date timeIntervalSince1970]+ [[NSTimeZone defaultTimeZone] secondsFromGMT])* 1000;
}

+ (BOOL)isEqualDateIgnoringTime:(NSDate*)date1 toDate:(NSDate*)date2
{
	// check for nil dates
	if((!date1 || !date2 ))
	{
		if(date1 != date2 )
			return NO;
		else
			return YES;
	}
	
	NSDateComponents *dateComponents1 = [DateTime componentsFromDate:date1];
	NSDateComponents *dateComponents2 = [DateTime componentsFromDate:date2];

	return ([dateComponents1 year] == [dateComponents2 year] &&
			[dateComponents1 month] == [dateComponents2 month] &&
			[dateComponents1 day] == [dateComponents2 day]);
}

+ (BOOL)isEqualTimeIgnoringDate:(NSDate*)time1 toTime:(NSDate*)time2
{
	// check for nil times
	if((!time1 || !time2 ))
	{
		if(time1 != time2 )
			return NO;
		else
			return YES;
	}
	
	NSDateComponents *dateComponents1 = [DateTime componentsFromDate:time1];
	NSDateComponents *dateComponents2 = [DateTime componentsFromDate:time2];
	
	return ([dateComponents1 hour] == [dateComponents2 hour] &&
			[dateComponents1 minute] == [dateComponents2 minute]);
}

+ (NSComparisonResult)compareDateIgnoringTime:(NSDate*)time1 andTime2:(NSDate*)time2
{
	if (!time1 )time1 = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
	if (!time2 )time2 = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
	
    unsigned unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
    
    NSDateComponents *comps1 = [[DateTime gregorianCalendar] components:unitFlags
                                                               fromDate:time1];
    NSDateComponents *comps2 = [[DateTime gregorianCalendar] components:unitFlags
                                                               fromDate:time2];
    
    NSDate *convertedTime1 = [[NSCalendar currentCalendar] dateFromComponents:comps1];
    NSDate *convertedTime2 = [[NSCalendar currentCalendar] dateFromComponents:comps2];
    
    return [convertedTime1 compare:convertedTime2];
}

+ (NSDateComponents*)dateComponentsOfDifferenceIgnoringSeconds:(NSDate*)time1 andTime:(NSDate*)time2
{
	if (!time1 )time1 = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
	if (!time2 )time2 = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
	
    unsigned unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit;
    
    NSDateComponents *comps1 = [[DateTime gregorianCalendar] components:unitFlags
                                                               fromDate:time1];
    
    NSDateComponents *comps2 = [[DateTime gregorianCalendar] components:unitFlags
                                                               fromDate:time2];
    NSDate *newTime1 = [DateTime dateFromComponents:comps1];
    NSDate *newTime2 = [DateTime dateFromComponents:comps2];
    
    return [[DateTime gregorianCalendar] components:unitFlags
                                           fromDate:newTime1
                                             toDate:newTime2
                                            options:0];
}

+ (NSString*)getGroupedDateStringFromDates:(NSArray*)dates dateFormat:(NSString*)format
{
	if(!dates || !dates.count )return @"";
	
	[[DateTime dateFormatter] setDateFormat:format];
	NSMutableString *result = [NSMutableString string];
	bool startGrouping = false;
	int groupCount = 0;
	
	// one day
	NSDateComponents *oneDay = [[NSDateComponents alloc] init];
	[oneDay setDay:1];
	
	for(int i = 0; i < dates.count; i++ )
	{
		NSDate *date = [dates objectAtIndex:i];
		
		// if grouping has not started, this date is the start of a group
		if(!startGrouping )
		{
			[result appendString:[[DateTime dateFormatter] stringFromDate:date]];
			startGrouping = YES;
			groupCount++;
		}
		
		// check next date cases are:
		//	- next date is just one day after this date, part of grouping; we continue.
		//	- no next date. end this grouping.
		//	- next date is more than one day after this date. end this grouping.
		NSDate *nextDay = [[DateTime gregorianCalendar] dateByAddingComponents:oneDay toDate:date options:0];
		if(i+ 1 < dates.count && [DateTime compareDateIgnoringTime:[dates objectAtIndex:i+ 1] andTime2:nextDay] == NSOrderedSame )
		{
			groupCount++;
			continue;
		}
		else
		{
			if(groupCount > 1 )
				[result appendFormat:@" - %@", [[DateTime dateFormatter] stringFromDate:date]];
			if(date != [dates lastObject] )
				[result appendString:@", "];
			
			startGrouping = NO;
			groupCount = 0;
		}
	}
	
	return result;
}

+ (NSString*)getStringRequestAPIForDate:(NSDate*)date
{
	[[DateTime dateFormatter] setDateFormat:@"yyyy-MM-dd"];
	return [[DateTime dateFormatter] stringFromDate:date];
}

+ (NSDate*)dateFromRemoveTimeOfDate:(NSDate*)date
{
	NSDateComponents *component = [DateTime dateOnlyComponentsFromDate:date];
	return [DateTime dateFromComponents:component];
}

+ (NSString*)getStringFromDate:(NSDate*)date withFormat:(NSString*)format
{
    [[DateTime dateFormatter] setDateFormat:format];
    return [[DateTime dateFormatter] stringFromDate:date];
}

@end

