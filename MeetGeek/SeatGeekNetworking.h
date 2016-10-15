//
//  SeatGeekNetworking.h
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SeatGeekNetworkingDelegate <NSObject>

- (void)dataRequestDidFinishLoading:(NSMutableArray *)array;

@end

@interface SeatGeekNetworking : NSObject

@property (weak) id delegate;

- (void)requestEventDataWithQuery:(NSString *)query;

@end
