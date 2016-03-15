//
//  PostPresentView.m
//  Poster
//
//  Created by Interns on 3/14/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "PostCellView.h"

@implementation PostCellView

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setUp];
}

- (void)setUp{
    [_userLabel setText:_post.user.email];
    [_postText setText:_post.postText];
    [_likesLabel setText:[NSString stringWithFormat:@"%d", _post.likes]];
    [_comentsCountLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)_post.coments.count]];
}
- (IBAction)likeButtonPressed:(id)sender {
}
- (IBAction)shareButtonPressed:(id)sender {
}

@end
