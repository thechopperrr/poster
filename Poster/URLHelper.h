//
//  URLHelper.h
//  Poster
//
//  Created by Interns on 3/25/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLHelper : NSObject

typedef NS_ENUM(NSInteger, ResourceType) {
    ResourceTypeUserValication,
    ResourceTypeisSuchUser,
    ResourceTypeUserRegistration,
    ResourceTypeForgetPassword,
    ResourceTypeNextFive,
    ResourceTypeLikePost,
    ResourceTypeDisLikePost,
    ResourceTypeComentPost,
    ResourceTypeMakePost,
    ResourceTypeNewImage,
    ResourceTypeGetComents,
    ResourceTypeChangePass,
};

+ (NSString*)pathForResource:(ResourceType) type;

@end
