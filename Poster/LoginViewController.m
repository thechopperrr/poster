//
//  ViewController.m
//  Poster
//
//  Created by Interns on 3/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "UserInfo.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nameTextField.placeholder = NSLocalizedString(@"mail_hint", nil);
    _passTextField.placeholder = NSLocalizedString(@"pass_hint", nil);
    self.navigationItem.title = NSLocalizedString(@"login_title", nil);
    
    if([UserInfo isUserLogged]){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        HomeViewController *controller = (HomeViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }
       // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)open:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    HomeViewController *controller = (HomeViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
    [self.navigationController pushViewController:controller animated:YES];
    

}

- (IBAction)loginButtonPressed:(id)sender {
    //check for empty fields
    User* user = [[User alloc]init];
    user.email = _nameTextField.text;
    user.pass = _passTextField.text;
    Requester* req = [[Requester alloc]init];
    req.delegate = self;
    [req verifyUser:user];
    
}

- (IBAction)registerButtonPressed:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RegisterViewController *controller = (RegisterViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"RegisterViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)forgetButtonPressed:(id)sender {
    if(_nameTextField.text.length < 1 ){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"wrong_reg_input", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
    else {
        User* user = [[User alloc]init];
        user.email = _nameTextField.text;
        Requester* req = [[Requester alloc]init];
        req.delegate = self;
        [req isSuchUser:user];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// delegates

- (void)userVerifiedFetched:(User*)usr{
    NSLog(@"email: %@", usr.email);
    
    if(usr.email && ![usr.email isEqual:[NSNull null]]){
        [UserInfo setUser:usr];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        HomeViewController *controller = (HomeViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
        [self.navigationController pushViewController:controller animated:YES];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"wrong_cred", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
}


- (void)isSuchUserFetched:(BOOL)yes{
    if(yes){
        User* user = [[User alloc]init];
        user.email = _nameTextField.text;
        Requester* req = [[Requester alloc]init];
        req.delegate = self;
        [req forgetPass:user];
        
    }
    else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"user_no_exist_error", nil)
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            
            [alert show];

        
    }
}

- (void)passwordSent:(BOOL)yes{
    NSString* message;
    if(yes){
        message = NSLocalizedString(@"password_sent", nil);
    } else{
        message = NSLocalizedString(@"password_sent_error", nil);

    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}

@end
