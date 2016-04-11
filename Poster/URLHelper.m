//
//  URLHelper.m
//  Poster
//
//  Created by Interns on 3/25/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "URLHelper.h"


@implementation URLHelper

+ (NSString*)pathForResource:(ResourceType) type{
    switch (type) {
        case ResourceTypeUserValication:
            return @"http://localhost:8080/RestApi/auth/validateUser";
            break;
            
        case ResourceTypeisSuchUser:
            return @"http://localhost:8080/RestApi/auth/isSuchUser";
            break;
            
        case ResourceTypeUserRegistration:
            return @"http://localhost:8080/RestApi/auth/register";
            break;
        case ResourceTypeForgetPassword:
            return @"http://localhost:8080/RestApi/auth/forgetPass";
            break;
        case ResourceTypeNextFive:
            return @"http://localhost:8080/RestApi/auth/nextFive";
            break;
        case ResourceTypeLikePost:
            return @"http://localhost:8080/RestApi/auth/like";
            break;
        case ResourceTypeDisLikePost:
            return @"http://localhost:8080/RestApi/auth/disLike";
            break;
        case ResourceTypeComentPost:
            return @"http://localhost:8080/RestApi/auth/makeComent";
            break;
        case ResourceTypeMakePost:
            return @"http://localhost:8080/RestApi/auth/makePost";
            break;
            
        default:
            return Nil;
            break;
    }
}

@end

