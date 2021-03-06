//
//  createPostViewController.m
//  Poster
//
//  Created by Interns on 4/10/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "CreatePostViewController.h"
#import "UserInfo.h"
#import "CharChecher.h"

#define MAX_POST_SIZE 200

@interface CreatePostViewController ()

@end

@implementation CreatePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _req = [[Requester alloc]init];
    _req.delegate = self;
        // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    _postTextView.layer.cornerRadius = 5;
    _postTextView.layer.masksToBounds = YES;
    _postTextView.layer.borderColor = [UIColor blueColor].CGColor;
    _postTextView.layer.borderWidth = 2.0f;
    self.automaticallyAdjustsScrollViewInsets = NO;
    _postTextView.text = @"";
    [_createButton setTitle:NSLocalizedString(@"make_post_button", nil) forState:UIControlStateNormal];
    self.title = NSLocalizedString(@"make_post_title", nil);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createButtonPressed:(id)sender {
    
    if(_postTextView.text.length > MAX_POST_SIZE){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"too_much_simbols", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if(_postTextView.text.length < 10){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"post_short", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if( ! [CharChecher isValidChar:_postTextView.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"not_allowed_chars", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }

    
    _tempPost = [[Post alloc]init];
    _tempPost.postText = _postTextView.text;
    _tempPost.date = [NSDate date];
    User* usr = [[User alloc]init];
    usr = [UserInfo getUser];
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

- (void)requestWithError:(NSHTTPURLResponse *)responce{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"network_error", nil)
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
    
}

// todo да определя броя на символите в поста и да едитна в документацията
@end
