//
//  YUVObj.h
//  YUVToImage
//
//  Created by mac on 15/7/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUVObj : NSObject

- (void)readYUV:(NSString*)path width:(int)width height:(int)height :(void(^)(NSData *spaces,bool isEnd))block;

- (void)cancel;

@end
