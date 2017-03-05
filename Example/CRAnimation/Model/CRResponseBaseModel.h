//
//  CRResponseBaseModel.h
//  CRAnimation
//
//  Created by Bear on 17/2/27.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRResponseBaseModel : NSObject

@property (strong, nonatomic) NSNumber      *code;
@property (strong, nonatomic) NSString      *msg;
@property (strong, nonatomic) NSDictionary  *data;
@property (strong, nonatomic) NSDictionary  *originData;

@end
