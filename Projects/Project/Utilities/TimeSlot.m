#import "TimeSlot.h"

@implementation TimeSlot

+ (int)validateTimeSlotId:(int)timeSlotId
{
	// convert 60 min into next hour
	if( ( timeSlotId % 100 ) / 60 ) timeSlotId += 100 - 60;
	return timeSlotId;
}

// 0000 returns 0 to 2345 returns 95
+ (int)indexOfTimeSlotId:(int)timeSlotId
{
	int tsid = [TimeSlot validateTimeSlotId:timeSlotId];
	
	return ( tsid / 100 * 4 ) + tsid % 100 / kTimeSlotInterval;
}

+ (int)timeSlotIdWithIndex:(int)index
{
	int timeSlotId = 0;
	for( int i = 0; i < index; i++ ) {
		timeSlotId = [TimeSlot validateTimeSlotId:(timeSlotId)];
        timeSlotId += 15;
	}
	return timeSlotId;
}

@end
