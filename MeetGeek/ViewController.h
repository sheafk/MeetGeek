//
//  ViewController.h
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeatGeekNetworking.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SeatGeekNetworkingDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *header;
@property (strong, nonatomic) IBOutlet UITextField *input;

@end

