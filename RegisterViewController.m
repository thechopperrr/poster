//
//  RegisterViewController.m
//  Poster
//
//  Created by Interns on 3/24/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "RegisterViewController.h"

@implementation RegisterViewController

- (IBAction)regButtonPressed:(id)sender {
    //todo: filter
    if(_email.text.length < 1 || _password.text.length < 1 || ![_password.text isEqualToString:_passAgain.text] ){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"wrong_reg_input", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
    else {
        User* user = [[User alloc]init];
        user.email = _email.text;
        user.pass = _password.text;
        Requester* req = [[Requester alloc]init];
        req.delegate = self;
        [req isSuchUser:user];

    }
}

- (void)isSuchUserFetched:(BOOL)yes{
    if(yes){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"user_exist_error", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];

    } else{
        User* user = [[User alloc]init];
        user.email = _email.text;
        user.pass = _password.text;
        Requester* req = [[Requester alloc]init];
        req.delegate = self;
        [req registerUser:user];

    }
}

- (void)registrationWitStatus:(BOOL)yes{
    NSString* message;
    if(yes){
        message = NSLocalizedString(@"user_successfully_register", nil);
    }
    else{
        message = NSLocalizedString(@"user_unsuccessfully_register", nil);
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
