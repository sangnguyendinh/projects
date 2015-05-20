//
//  RSVConfig.m
//  Reserveit
//
//  Created by Admin on 8/1/14.
//  Copyright (c) 2014 S3 Corp. All rights reserved.
//

#import "RSVConfig.h"

@implementation RSVConfig


static NSInteger evnIndex = 1; // 0: production, 1: test, 2: debug


#pragma mark - Base

+ (NSString *)baseDomainURL {
    static NSArray *listServers = nil;
    
    if (listServers == nil) {
        listServers = [NSArray arrayWithObjects:
                        @"http://webapi.seats.com.ph",          // 0: production
                        @"http://seatsqa1.tabledb.com:8080",    // 1: test
                        @"http://10.100.0.201:8080",            // 2: debug
                        nil];
    }
    
    return [listServers objectAtIndex:evnIndex];
}

+ (NSString *)baseDomainThumbnail {
    static NSArray *listThumbServers = nil;
    
    if (listThumbServers == nil) {
        listThumbServers = [NSArray arrayWithObjects:
                       @"https://tabledb-seats.s3.amazonaws.com/seats/rest",    // 0: production
                       @"http://web.seatsqa1.tabledb.com/img/rest",             // 1: test
                       @"http://web.qa1.tabledb.com/img/rest",                  // 2: debug
                       nil];
    }
    
    return [listThumbServers objectAtIndex:evnIndex];
}

+ (NSString *)baseURL {
    static NSString *baseURL = nil;
    
    if (baseURL == nil) {
        baseURL = [NSString stringWithFormat:@"%@/tabledb-web/", [RSVConfig baseDomainURL]];
    }
    
    return baseURL;
}


#pragma mark - Service

+ (NSString *)servicePartnerCode {
    static NSArray *servicePartnerCodes = nil;
    
    if (servicePartnerCodes == nil) {
        servicePartnerCodes = [NSArray arrayWithObjects:
                               @"seats", // 0: production
                               @"seats", // 1: Test
                               @"seats", // 2: debug
                       nil];
    }
    
    return [servicePartnerCodes objectAtIndex:evnIndex];
}

+ (NSString *)servicePartnerAuthCode {
    static NSArray *servicePartnerAuthCodes = nil;
    
    if (servicePartnerAuthCodes == nil) {
        servicePartnerAuthCodes = [NSArray arrayWithObjects:
                                   @"C01CF784-794D-4CAA-A4C3-37AE69E631E7", // 0: production
                                   @"C01CF784-794D-4CAA-A4C3-37AE69E631E7", // 1: Test
                                   @"C01CF784-794D-4CAA-A4C3-37AE69E631E7", // 2: debug
                                  nil];
    }
    
    return [servicePartnerAuthCodes objectAtIndex:evnIndex];
}

+ (NSString *)serviceWidgetId {
    static NSArray *serviceWidgetIds = nil;
    
    if (serviceWidgetIds == nil) {
        serviceWidgetIds = [NSArray arrayWithObjects:
                            @"54728d3355bda4ff32479560", // 0: production
                            @"54728d3355bda4ff32479560", // 1: Test
                            @"54728d3355bda4ff32479560", // 2: debug
                                   nil];
    }
    
    return [serviceWidgetIds objectAtIndex:evnIndex];
}


+ (NSString *)termLinks {
    NSArray *termLinksArray = [NSArray arrayWithObjects:
                               @"http://restaurants.seats.com.ph/terms",    // 0: production
                               @"http://testsrestaurant.tabledb.com/terms", // 1: Test
                               @"http://testsrestaurant.tabledb.com/terms", // 2: debug
                               nil];
    
    return [termLinksArray objectAtIndex:evnIndex];
}

#pragma mark - Flurry

+ (NSString *)flurryApiKey {
    NSArray *flurryApiKeys = [NSArray arrayWithObjects:
                                    @"3JDW49MMVVPX3VN32TPR", // 0: production
                                    @"ZK3GDW2ZNWY4875JRZXZ", // 1: Test
                                    @"RJKBYC3H7KXVH8Q9VTNW", // 2: debug
                                    nil];
    
    return [flurryApiKeys objectAtIndex:evnIndex];
}

@end
