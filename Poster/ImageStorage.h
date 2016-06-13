//
//  ImageStorage.h
//  Poster
//
//  Created by Interns on 5/25/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageStorage : NSObject

+ (void)writeImage:(UIImage*)image withFileName:(NSString*)name;

+ (UIImage*) readImageWithFileName:(NSString*)name;

+ (void)deleteImageWithFileName:(NSString*)path;

@end

