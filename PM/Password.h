//
//  Password.h
//  PM
//
//  Created by Apple on 15/12/13.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject

@property NSString *title;
@property NSString *password;
@property NSString *pid;
@property NSString *groupName;
@property (readonly) NSDate *creationDate;
@end
