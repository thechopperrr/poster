//
//  Coment.m
//  Poster
//
//  Created by Interns on 3/15/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "Coment.h"

@implementation Coment

- (NSString*)getStringDate{
    long date = ([self.date timeIntervalSinceReferenceDate] * 1000);
    return [NSString stringWithFormat:@"%ld", date];
}

@end
