//
//  Event.h
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Event : NSObject

@property NSString *name;
@property NSString *urlString;
@property NSString *time;
@property UIImage *image;
@property int eventId;

@end
