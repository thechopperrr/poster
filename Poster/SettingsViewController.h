//
//  SettingsViewController.h
//  Poster
//
//  Created by Interns on 4/22/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface SettingsViewController : UIViewController
@property User* user;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UITextField *passAgainTextField;
@property (weak, nonatomic) IBOutlet UIButton *savePass;
@property (weak, nonatomic) IBOutlet UIButton *logOutButton;
@property (weak, nonatomic) IBOutlet UITextField *imageTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveImageButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
