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
    _user = [UserInfo getUser];
    [super viewDidLoad];
    _passTextField.placeholder = NSLocalizedString(@"pass_hint", nil);
    _passAgainTextField.placeholder = NSLocalizedString(@"pass_hint_2", nil);
    _imageTextField.placeholder = NSLocalizedString(@"image_url", nil);
        
    if(_user.imageUrl){
        [_imageView setImage:[Requester getImageFromURL:_user.imageUrl]];
    }
    else {
        [_imageView setImage:[UIImage imageNamed:@"profile"]];
    }

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savePassButtonPressed:(id)sender {
    if([_passAgainTextField.text isEqualToString:_passTextField.text] && (_passTextField.text.length > MIN_PASS_SIZE)){
        
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
