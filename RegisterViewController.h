//
//  RegisterViewController.h
//  Poster
//
//  Created by Interns on 3/24/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Requester.h"

@interface RegisterViewController : UIViewController<RequesterDelegate>

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passAgain;
@property (weak, nonatomic) IBOutlet UIButton *regButton;

@end
