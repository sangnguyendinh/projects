#define kTimeSlotInterval 15

@interface TimeSlot : NSObject

+ (int)validateTimeSlotId:(int)timeSlotId;
+ (int)indexOfTimeSlotId:(int)timeSlotId;
+ (int)timeSlotIdWithIndex:(int)index;

@end


