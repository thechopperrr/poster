//
//  createPostViewController.h
//  Poster
//
//  Created by Interns on 4/10/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Requester.h"

@interface CreatePostViewController : UIViewController <RequesterDelegate>
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UITextView *postTextView;
@property Requester* req;
@property Post* tempPost;

@end
