//
//  Serialization.m
//  Poster
//
//  Created by Interns on 3/28/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "Serialization.h"
#import "Post.h"
#import "Coment.h"
#import "User.h"

@implementation Serialization

+ (NSArray*)jsonToPostArray:(NSString*)jsonStr{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray* coments;
    
    for(NSDictionary* object in jsonArray){
        NSDictionary* user = [object objectForKey:@"user"];
        if([[object objectForKey:@"coments"] isKindOfClass:[NSArray class]]){
            coments = [object objectForKey:@"coments"];
        }
        NSMutableArray* parsedComents = [[NSMutableArray alloc]init];
        
        for(NSDictionary* comDict in coments){
            Coment* com = [[Coment alloc]init];
            com.userMail = [comDict objectForKey:@"userMail"];
            com.comentText = [comDict objectForKey:@"comentText"];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:([[comDict objectForKey:@"date"] longLongValue] / 1000.0)];
            com.date = date;
            com.postId = (int)[comDict objectForKey:@"postId"];
            [parsedComents addObject:com];
        }
        
        NSString* postText = [object objectForKey:@"postText"];
        NSString* postDate = [object objectForKey:@"postDate"];
        NSMutableArray* likes = [[NSMutableArray alloc]initWithArray:[object objectForKey:@"likes"]];
        likes = [self clearArray:likes];
        
        
        Post* p = [[Post alloc]init];
        p.user = [[User alloc]init];
        p.postId = [[object objectForKey:@"postId"] longLongValue];
        p.user.email = [user objectForKey:@"mail"];
        p.user.imageUrl = [user objectForKey:@"imageUrl"];
        p.postText = postText;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:([postDate longLongValue] / 1000.0)];
        p.date = date;
        p.coments = parsedComents;
        p.likes = likes;
        [array addObject:p];
    }
    
    return array;
}

+ (NSMutableArray*)clearArray:(NSMutableArray*) arr{
    NSMutableIndexSet *indexes = [[NSMutableIndexSet alloc] init];
    for(int i=0; i<arr.count; i++){
        if([arr[i] isEqualToString:@""]){
            [indexes addIndex:i];
        }
    }
    [arr removeObjectsAtIndexes:indexes];
    return arr;
}

+ (User*)jsonToUser:(NSString*)jsonStr{

    User* usr = [[User alloc]init];
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           usr.email = [object objectForKey:@"mail"];
        usr.pass =  [object objectForKey:@"pass"];
        usr.imageUrl = [object objectForKey:@"imageUrl"];
    
    return usr;
}

@end
