//
//  PostPresentView.h
//  Poster
//
//  Created by Interns on 3/14/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Requester.h"

@protocol PostCellViewProtocol <NSObject>

- (void)openComentsWithPost:(Post*)post;
- (void)sharePost:(Post*)post;

@end

@interface PostCellView : UITableViewCell <RequesterDelegate>

@property (weak, nonatomic) IBOutlet UIButton *testbutt;
- (IBAction)testButtAction:(id)sender;
@property Post* post;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UITextView *comentTextView;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *comentsCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *comentsButton;
@property Requester* requester;
@property (weak, nonatomic) IBOutlet UIView *innerView;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;


@property (nonatomic, weak) id<PostCellViewProtocol> delegate;

@end
