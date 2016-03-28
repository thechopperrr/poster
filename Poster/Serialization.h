//
//  Serialization.h
//  Poster
//
//  Created by Interns on 3/28/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface Serialization : NSObject

+ (NSArray*)jsonToPostArray:(NSString*)jsonStr;

@end
