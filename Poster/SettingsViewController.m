//
//  SettingsViewController.m
//  Poster
//
//  Created by Interns on 4/22/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "SettingsViewController.h"
#import "Requester.h"
#import "UserInfo.h"
#define MIN_PASS_SIZE 3

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    _requester = [[Requester alloc]init];
    _requester.delegate = self;
    self.title = NSLocalizedString(@"settings", nil);
    _user = [UserInfo getUser];
    [self setUp];
        // Do any additional setup after loading the view.
}

- (void)setUp{
    _passTextField.placeholder = NSLocalizedString(@"pass_hint", nil);
    _passAgainTextField.placeholder = NSLocalizedString(@"pass_hint_2", nil);
    _imageTextField.placeholder = NSLocalizedString(@"image_url", nil);
    [_saveImageButton setTitle:NSLocalizedString(@"save_new_image", nil) forState:UIControlStateNormal];
    
    [_savePass setTitle:NSLocalizedString(@"change_pass", nil) forState:UIControlStateNormal];
    [_logOutButton setTitle:NSLocalizedString(@"log_out", nil) forState:UIControlStateNormal];
    
    if(_user.imageUrl){
        [_imageView setImage:[Requester getImageFromURL:_user.imageUrl]];
    }
    else {
        [_imageView setImage:[UIImage imageNamed:@"profile"]];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savePassButtonPressed:(id)sender {
    if([_passAgainTextField.text isEqualToString:_passTextField.text] && (_passTextField.text.length > MIN_PASS_SIZE)){
        [_requester changePassForUser:[UserInfo getUser] andNewPass:_passTextField.text];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"wrong_pass_change", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];

    }

}

- (IBAction)logOutButtonPressed:(id)sender {
    [UserInfo logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)saveImageButtonPressed:(id)sender {
    if([self isUrl:_imageTextField.text]){
        [_requester setImage:_imageTextField.text toUser:[UserInfo getUser]];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"not_url", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
        _imageTextField.text = @"";

    }
}

- (BOOL)isUrl:(NSString*)text{
    //todo make it 
    return YES;
}

- (void)imageSetted:(NSString *)imageUrl{
    _user.imageUrl = imageUrl;
    [UserInfo setUser:_user];
    [self setUp];
}

- (void)passChangetSuccessfully:(BOOL)yes{
    if(yes){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pass_changed", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"password_sent_error", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
