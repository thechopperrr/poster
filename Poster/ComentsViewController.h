//
//  ComentsViewController.h
//  Poster
//
//  Created by Interns on 3/16/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComentCellView.h"
#import "Post.h"
#import "Requester.h"

@interface ComentsViewController : UIViewController<RequesterDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextView *comentTextView;
@property (weak, nonatomic) IBOutlet UIButton *comentButtonTextView;
@property Post* post;
@property Coment* tempComent;
@property Requester* requester;

@end
