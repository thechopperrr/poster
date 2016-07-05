
//
//  PostPresentView.m
//  Poster
//
//  Created by Interns on 3/14/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "PostCellView.h"
#import "UserInfo.h"
#import "Requester.h"

@implementation PostCellView
- (IBAction)cmtBtn:(id)sender {
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setUp];
}

- (void)setUp{
    [_userLabel setText:[NSString stringWithFormat:@" %@", _post.user.email]];
    [_comentTextView setText:_post.postText];
    [_likesLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)_post.likes.count]];
    [_comentsCountLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)_post.coments.count]];
    _requester = [[Requester alloc]init];
    _requester.delegate = self;
    for(int i=0; i<_post.likes.count; i++){
        if([_post.likes[i] isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"]]){
            [_likeButton removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventAllEvents];
            [_likeButton addTarget:self action:@selector(disLikeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [_likeButton setImage:[UIImage imageNamed:@"liked"] forState:UIControlStateNormal];

        } else{
            [_likeButton removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventAllEvents];
            [_likeButton addTarget:self action:@selector(likeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [_likeButton setImage:[UIImage imageNamed:@"noliked"] forState:UIControlStateNormal];

        }
    }
    if(_post.likes.count < 1){
        [_likeButton removeTarget:nil
                           action:NULL
                 forControlEvents:UIControlEventAllEvents];
        [_likeButton addTarget:self action:@selector(likeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_likeButton setImage:[UIImage imageNamed:@"noliked"] forState:UIControlStateNormal];
    }
    _innerView.layer.cornerRadius = 5;
    _innerView.layer.masksToBounds = YES;
    [_userImage setImage:[_requester getImageFromURL:_post.user.imageUrl]];
    [_dateLabel setText:_post.date.description];
}

- (IBAction)likeButtonPressed:(id)sender {

    if([UserInfo getLoggedUserName])
        [_requester likePostWithId:_post.postId andUser:[UserInfo getLoggedUserName]];
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pls_login", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
}

- (IBAction)disLikeButtonPressed:(id)sender {
    
    if([UserInfo getLoggedUserName])
        [_requester disLikePostWithId:_post.postId andUser:[[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"]];
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pls_login", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)imageDounloadingFailed{
    
}

- (IBAction)shareButtonPressed:(id)sender {
    [_delegate sharePost:_post];
}


- (IBAction)testButtAction:(id)sender {
    if([UserInfo getLoggedUserName])
        [_delegate openComentsWithPost:_post];
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pls_login", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }

}

- (void)postLiked:(BOOL) yes{
    if(yes){
        NSString* name = [[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"];
        [_post.likes addObject:name];
        [self setUp];
    }
    else {
        //todo error
    }
}

- (void)postDisLiked:(BOOL)yes{
    if(yes){
        [_post.likes removeObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"]];
        [self setUp];
    }
    else {
        //todo error
    }
}

- (void)requestWithError:(NSHTTPURLResponse *)responce{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"server_error", nil)
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
