//
//  RegisterViewController.m
//  Poster
//
//  Created by Interns on 3/24/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "RegisterViewController.h"
#import "CharChecher.h"

@implementation RegisterViewController

- (void)viewDidLoad{
    _email.placeholder = NSLocalizedString(@"mail_hint", nil);
    _password.placeholder = NSLocalizedString(@"pass_hint", nil);
    _passAgain.placeholder = NSLocalizedString(@"pass_hint_2", nil);
    [_regButton setTitle:NSLocalizedString(@"register", nil) forState:UIControlStateNormal];
    self.title = NSLocalizedString(@"register", nil);

}

- (IBAction)regButtonPressed:(id)sender {
    //todo: filter
    if(! [self NSStringIsValidEmail:_email.text] || ! [CharChecher isValidChar:_email.text] || _password.text.length < 1 || ! [CharChecher isValidChar:_password.text]|| _password.text.length > 45 || ![_password.text isEqualToString:_passAgain.text] ){
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

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    if(checkString.length < 3 || checkString.length > 45)
    {
        return NO;
    }
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
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

- (void)requestWithError:(NSHTTPURLResponse *)responce{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"network_error", nil)
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
    
}

@end
