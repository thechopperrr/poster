//
//  HomeViewController.h
//  Poster
//
//  Created by Interns on 3/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "LoginViewController.h"
#import "PostCellView.h"

@interface HomeViewController : UIViewController <PostCellViewProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//temporary
@property NSArray* posts;

@end
