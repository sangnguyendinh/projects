//
//  UniqueDeviceID.h
//  GetMacAddress
//
//  Created by kerching on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UniqueDeviceID : NSObject{

    NSString* uniqueIdentifier;
}
@property(nonatomic,retain)NSString * uniqueIdentifier;

+(id)currentUDID;
+(BOOL)isSameID:(NSString*)udid;
- (NSString *)getMacAddress;
+ (NSString *)stringToHex:(NSString*)str;
+ (NSString *)sha1:(NSString *)str;
@end
