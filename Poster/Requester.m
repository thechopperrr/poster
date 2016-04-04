//
//  Requester.m
//  Poster
//
//  Created by Interns on 3/24/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "Requester.h"
#import "Serialization.h"



//on user returns {"mail":"hose@abv.bg","pass":"123"}
@implementation Requester


- (void)verifyUser:(User*)user{
    NSString* jsonUser =[NSString stringWithFormat:@"{\"mail\":\"%@\",\"pass\":\"%@\"}", user.email, user.pass];
    NSString* path = [URLHelper pathForResource:ResourceTypeUserValication];
    [self createRequest:jsonUser andPath:path json:YES];
}

- (void)registerUser:(User*)user{
    NSString* jsonUser =[NSString stringWithFormat:@"{\"mail\":\"%@\",\"pass\":\"%@\"}", user.email, user.pass];
    NSString* path = [URLHelper pathForResource:ResourceTypeUserRegistration];
    [self createRequest:jsonUser andPath:path json:YES];
}

- (void)isSuchUser:(User*)user{
    NSString* jsonUser =[NSString stringWithFormat:@"{\"mail\":\"%@\",\"pass\":\"%@\"}", user.email, user.pass];
    NSString* path = [URLHelper pathForResource:ResourceTypeisSuchUser];
    [self createRequest:jsonUser andPath:path json:YES];
}

- (void)forgetPass:(User*)user{
    NSString* jsonUser =[NSString stringWithFormat:@"{\"mail\":\"%@\",\"pass\":\"%@\"}", user.email, user.pass];
    NSString* path = [URLHelper pathForResource:ResourceTypeForgetPassword];
    [self createRequest:jsonUser andPath:path json:YES];
}

- (void)getNextFive:(int)start{
    NSString* path = [URLHelper pathForResource:ResourceTypeNextFive];
    [self createRequest:[NSString stringWithFormat:@"%d",start] andPath:path json:NO];
}

- (void)likePostWithId:(long)postId andUser:(NSString*)user{
    NSString* path = [URLHelper pathForResource:ResourceTypeLikePost];
    NSString *fullPath = [NSString stringWithFormat:@"%@?postId=%ld&userMail=%@", path, postId, user];
    [self sendGetRequest:fullPath];
}

- (void)disLikePostWithId:(long)postId andUser:(NSString*)user{
    NSString* path = [URLHelper pathForResource:ResourceTypeDisLikePost];
    NSString *fullPath = [NSString stringWithFormat:@"%@?postId=%ld&userMail=%@", path, postId, user];
    [self sendGetRequest:fullPath];
}

- (void)sendGetRequest:(NSString *)url_str {
    NSURL *url = [NSURL URLWithString:url_str];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}



-(void)createRequest: (NSString*)value andPath:(NSString*) path json:(bool)yes
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    // Specify that it will be a POST request
    
    request.HTTPMethod = @"POST";
    NSData *postData = [value dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    if(yes)
        [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    else
        [request setValue:@"text/plain; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    NSURL *myURL = [[connection currentRequest] URL];
    NSString* url = [myURL absoluteString];
    NSString *responseString = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
    
    //user verification
    
    if([url isEqualToString:[URLHelper pathForResource:ResourceTypeUserValication]]){
        if([responseString isEqualToString:@"YES"])
            [_delegate userVerifiedFetched:YES];
        else
            [_delegate userVerifiedFetched:NO];
    }
    if([url isEqualToString:[URLHelper pathForResource:ResourceTypeUserRegistration]]){
        if([responseString isEqualToString:@"YES"])
            [_delegate registrationWitStatus:YES];
        else
            [_delegate registrationWitStatus:NO];
    }
    
    if([url isEqualToString:[URLHelper pathForResource:ResourceTypeisSuchUser]]){
        if([responseString isEqualToString:@"YES"])
            [_delegate isSuchUserFetched:YES];
        else
            [_delegate isSuchUserFetched:NO];
    }
    
    if([url isEqualToString:[URLHelper pathForResource:ResourceTypeForgetPassword]]){
        if([responseString isEqualToString:@"YES"])
            [_delegate passwordSent:YES];
        else
            [_delegate passwordSent:NO];
    }
    
    if([url isEqualToString:[URLHelper pathForResource:ResourceTypeNextFive]]){
        NSArray* posts = [Serialization jsonToPostArray:responseString];
        [_delegate nextFiveFetched:posts];
    }
    
    if ([url rangeOfString:[URLHelper pathForResource:ResourceTypeLikePost]].location != NSNotFound){
        if([responseString isEqualToString:@"YES"])
            [_delegate postLiked:YES];
        else
            [_delegate postLiked:NO];
    }
    
    if ([url rangeOfString:[URLHelper pathForResource:ResourceTypeDisLikePost]].location != NSNotFound){
        if([responseString isEqualToString:@"YES"])
            [_delegate postDisLiked:YES];
        else
            [_delegate postDisLiked:NO];
    }

    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    
}


@end
