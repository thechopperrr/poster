//
//  ImageStorage.m
//  Poster
//
//  Created by Interns on 5/25/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "ImageStorage.h"

@implementation ImageStorage

+ (void)writeImage:(UIImage*)image withFileName:(NSString*)name
{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",name]];
    [imageData writeToFile:docPath atomically:YES];
}

+ (UIImage*)readImageWithFileName:(NSString*)name
{
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",name]];
    if (imagePath) {
        return [UIImage imageWithData:[NSData dataWithContentsOfFile:imagePath]];
    }
    return nil;
}

+ (void)deleteImageWithFileName:(NSString*)path
{
    NSError *error;
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",path]];
    NSFileManager* fm = [[NSFileManager alloc]init];
    [fm removeItemAtPath:imagePath error:&error];
    if (error){
        NSLog(@"%@", error);
    }
}

@end