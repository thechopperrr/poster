//
//  ViewController.h
//  Poster
//
//  Created by Interns on 3/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "Requester.h"
#import "CharChecher.h"

@interface LoginViewController : UIViewController<RequesterDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;


@end

