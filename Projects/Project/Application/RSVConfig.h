//
//  RSVConfig.h
//  Reserveit
//
//  Created by Admin on 8/1/14.
//  Copyright (c) 2014 S3 Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSVConfig : NSObject

+ (NSString *)baseDomainThumbnail;
+ (NSString *)baseDomainURL;
+ (NSString *)baseURL;

+ (NSString *)servicePartnerCode;
+ (NSString *)servicePartnerAuthCode;
+ (NSString *)serviceWidgetId;

+ (NSString *)flurryApiKey;
+ (NSString *)termLinks;

@end
