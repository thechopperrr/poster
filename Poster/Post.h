//
//  Post.h
//  Poster
//
//  Created by Interns on 3/15/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Coment.h"

@interface Post : NSObject

@property User* user;
@property NSString* postText;
@property int likes;
@property NSDate* date;
@property NSArray* coments;

@end