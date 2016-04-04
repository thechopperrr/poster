
//
//  PostPresentView.m
//  Poster
//
//  Created by Interns on 3/14/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "PostCellView.h"

@implementation PostCellView
- (IBAction)cmtBtn:(id)sender {
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setUp];
}

- (void)setUp{
    [_userLabel setText:_post.user.email];
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
            [_likeButton setTitle:@"-" forState:UIControlStateNormal];
            //todo set image
        } else{
            [_likeButton removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventAllEvents];
            [_likeButton addTarget:self action:@selector(likeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [_likeButton setTitle:@"+" forState:UIControlStateNormal];
            //todo set image
        }
    }
}
- (IBAction)likeButtonPressed:(id)sender {

    [_requester likePostWithId:_post.postId andUser:[[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"]];
}

- (IBAction)disLikeButtonPressed:(id)sender {
    
    [_requester disLikePostWithId:_post.postId andUser:[[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"]];
}

- (IBAction)shareButtonPressed:(id)sender {
    //open share vc in social media 
}


- (IBAction)testButtAction:(id)sender {
    [_delegate openComentsWithPost:_post];
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
@end
