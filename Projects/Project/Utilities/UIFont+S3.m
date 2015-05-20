//
//  UIFont+ARIS.m
//  ARIS VIETNAM
//
//  Created by Hung Tran on 8/3/12.
//  Copyright (c) ARIS VIETNAM. All rights reserved.
//

#import "UIFont+S3.h"

@implementation UIFont(S3)


#pragma mark - Logging

+ (void)listAllFonts {
    for (NSString *familyName in [UIFont familyNames]) {
        NSLog(@"%@", familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"- %@", fontName);
        }
    }
}

@end
