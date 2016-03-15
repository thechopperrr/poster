//
//  PostPresentView.h
//  Poster
//
//  Created by Interns on 3/14/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol PostCellViewProtocol <NSObject>

- (void)aRequiredMethod;

@end

@interface PostCellView : UITableViewCell

@property Post* post;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *postText;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *comentLabel;
@property (weak, nonatomic) IBOutlet UILabel *comentsCountLabel;

@property (nonatomic, weak) id<PostCellViewProtocol> delegate;

@end
