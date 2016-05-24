//
//  HomeViewController.h
//  Poster
//
//  Created by Interns on 3/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "LoginViewController.h"
#import "PostCellView.h"
#import "Requester.h"
#import "UserInfo.h"

@interface HomeViewController : UIViewController <PostCellViewProtocol, RequesterDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray* posts;
@property bool loading;
@property Requester* requester;
@property (weak, nonatomic) IBOutlet UIButton *addPostButton;
@property (weak, nonatomic) IBOutlet UIButton *logOutButton;
@property UIActivityIndicatorView *spinner;


@end
