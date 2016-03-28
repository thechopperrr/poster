
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
}
- (IBAction)likeButtonPressed:(id)sender {
    //todo
    //send like request, like in app when reciewe + responce
}
- (IBAction)shareButtonPressed:(id)sender {
    //open share vc in social media 
}


- (IBAction)testButtAction:(id)sender {
    [_delegate openComentsWithPost:_post];
}
@end
