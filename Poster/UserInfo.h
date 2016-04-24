//
//  UserInfo.h
//  Poster
//
//  Created by Interns on 4/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserInfo : NSObject

+ (NSString*)getLoggedUserName;
+ (NSString*)getLoggedUserPass;
+ (BOOL)isUserLogged;
+ (void)logOut;
+ (void)loginWithUserName:(NSString*)name andPass: (NSString*)pass;
+ (User*)getUser;
+ (void)setUser:(User*)usr;

@end
