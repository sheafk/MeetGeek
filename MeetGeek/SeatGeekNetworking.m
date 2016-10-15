//
//  SeatGeekNetworking.m
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import "SeatGeekNetworking.h"
#import "Event.h"

@interface SeatGeekNetworking()

@property (nonatomic) NSMutableArray *eventList;
@end

@implementation SeatGeekNetworking


- (void)requestEventDataWithQuery:(NSString *)query {
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSString *urlString = [NSString stringWithFormat: @"https://api.seatgeek.com/2/events?q=%@", query];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // Convert JSON to data
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *eventArray = [dictionary objectForKey:@"events"];
        self.eventList = [NSMutableArray new];
        
        // Keep an array of times to only show unique events (weed out duplicates)
        NSMutableArray *timesArray = [NSMutableArray new];
        
        

        // Loop through array of events
        for (NSDictionary *currentEventDictionary in eventArray) {
            
            Event *newEvent = [[Event alloc] init];
            
            if ([[currentEventDictionary objectForKey:@"title"] isKindOfClass:[NSString class]]) {
                
                NSString *time = [currentEventDictionary objectForKey:@"datetime_local"];
                
                // Check that the event is unique
                if ([timesArray containsObject:time]) {
                    break;
                }
                else {
                    newEvent.time = time;
                    newEvent.name = [currentEventDictionary objectForKey:@"title"];
                    newEvent.eventId = [[currentEventDictionary objectForKey:@"id"] intValue];
                    [timesArray addObject:time];
                }
                
                NSString *imageString = [[currentEventDictionary objectForKey:@"performers"][0] objectForKey:@"image"];
                NSLog(@"%@", imageString);
                
                if ([imageString isKindOfClass:[NSString class]]) {
                    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageString]];
                    newEvent.image = [UIImage imageWithData: imageData];
                }
                else {
                    newEvent.image = [UIImage imageNamed: @"curtains"];
                }
                
                [self.eventList addObject:newEvent];
            }
            else {
                break;
            }
        }
        
        // After all events are added to the array
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate dataRequestDidFinishLoading:self.eventList];
            NSLog(@"%@", self.eventList);
        });
        
    }];
    [dataTask resume];
}

@end
