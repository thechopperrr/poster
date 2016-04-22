//
//  UserInfo.m
//  Poster
//
//  Created by Interns on 4/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (NSString*)getLoggedUserName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"userEmail"];
}

+ (NSString*)getLoggedUserPass{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"userPass"];
}

+ (BOOL)isUserLogged{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"userEmail"]){
        return YES;
    }
    else {
        return NO;
    }
}

+ (void)logOut{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:Nil forKey:@"userEmail"];
    [defaults setObject:Nil forKey:@"userPass"];
}

+ (void)loginWithUserName:(NSString*)name andPass: (NSString*)pass{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"userEmail"];
    [defaults setObject:pass forKey:@"userPass"];
}


@end
