//
//  CharChecher.m
//  Poster
//
//  Created by Interns on 7/5/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "CharChecher.h"
#define ACCEPTABLE_CHARACTERS @" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-.@"

@implementation CharChecher

+ (bool)isValidChar:(NSString*)string{
    NSCharacterSet  *set= [NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARACTERS];
    if ([string rangeOfCharacterFromSet:[set invertedSet]].location == NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

@end
