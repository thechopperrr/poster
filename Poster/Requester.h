//
//  Requester.h
//  Poster
//
//  Created by Interns on 3/24/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "URLHelper.h"

@protocol RequesterDelegate <NSObject>

-(void)userVerifiedFetched:(BOOL) yes;
-(void)registrationWitStatus:(BOOL) yes;
-(void)isSuchUserFetched:(BOOL) yes;
- (void)passwordSent:(BOOL) yes;

@end

@interface Requester : NSObject <NSURLConnectionDelegate>

@property NSMutableData *responseData;

- (void)verifyUser:(User*)user;
- (void)isSuchUser:(User*)user;
- (void)registerUser:(User*)user;
- (void)forgetPass:(User*)user;

@property(nonatomic,assign)id<RequesterDelegate>delegate;

@end
