//
//  createPostViewController.m
//  Poster
//
//  Created by Interns on 4/10/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "CreatePostViewController.h"

@interface CreatePostViewController ()

@end

@implementation CreatePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _req = [[Requester alloc]init];
    _req.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createButtonPressed:(id)sender {
    _tempPost = [[Post alloc]init];
    _tempPost.postText = _postTextView.text;
    User* usr = [[User alloc]init];
    usr.email = [[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"];
    usr.pass = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPass"];
    _tempPost.user = usr;
    [_req makePost:_tempPost];
    _postTextView.text = @"";
}

- (void)postCreated:(BOOL)yes{
    if(yes){
        [_posts insertObject:_tempPost atIndex:0];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"network_or_server_error", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
}

@end
