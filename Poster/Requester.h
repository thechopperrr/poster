//
//  Requester.h
//  Poster
//
//  Created by Interns on 3/24/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Coment.h"
#import "URLHelper.h"
#import "Post.h"
#import <UIKit/UIKit.h>

@protocol RequesterDelegate <NSObject>

@optional
-(void)userVerifiedFetched:(User*) usr;
-(void)registrationWitStatus:(BOOL) yes;
-(void)isSuchUserFetched:(BOOL) yes;
- (void)passwordSent:(BOOL) yes;
- (void)nextFiveFetched:(NSArray*)posts;
- (void)postLiked:(BOOL) yes;
- (void)postDisLiked:(BOOL) yes;
- (void)comentMaked:(BOOL) yes;
- (void)postCreated:(BOOL) yes;
- (void)imageSetted:(NSString*)imageUrl;
- (void)cometsFetched:(NSMutableArray*)coments;
- (void)passChangetSuccessfully:(BOOL)yes;
- (void)imageDounloadingFailed;

@required
- (void)requestWithError:(NSHTTPURLResponse*)responce;

@end

@interface Requester : NSObject <NSURLConnectionDelegate>

@property NSMutableData *responseData;

- (void)verifyUser:(User*)user;
- (void)isSuchUser:(User*)user;
- (void)registerUser:(User*)user;
- (void)forgetPass:(User*)user;
- (void)getNextFive:(int)start;
- (void)likePostWithId:(long)postId andUser:(NSString*)user;
- (void)disLikePostWithId:(long)postId andUser:(NSString*)user;
- (void)makeComent:(Coment*)coment;
- (void)makePost:(Post*)post;
- (UIImage *) getImageFromURL:(NSString *)fileURL;
- (void)setImage:(NSString*)imageUrl toUser:(User*)user;
- (void)getComentsForPostWithId:(int)postId;
- (void)changePassForUser:(User*)user andNewPass:(NSString*)pass;

@property(nonatomic,assign)id<RequesterDelegate>delegate;

@end
