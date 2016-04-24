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
    [defaults synchronize];
}

+ (void)loginWithUserName:(NSString*)name andPass: (NSString*)pass{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"userEmail"];
    [defaults setObject:pass forKey:@"userPass"];
    [defaults synchronize];
}

+ (User*)getUser{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    User* usr = [[User alloc]init];
    usr.email = [defaults objectForKey:@"userEmail"];
    usr.pass = [defaults objectForKey:@"userPass"];
    usr.imageUrl = [defaults objectForKey:@"imageUrl"];
    return usr;
}

+ (void)setUser:(User *)usr{
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:usr.email forKey:@"userEmail"];
    [defaults setObject:usr.pass forKey:@"userPass"];
    [defaults setObject:usr.imageUrl forKey:@"imageUrl"];
    [defaults synchronize];
}
@end
