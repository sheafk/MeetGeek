//
//  SignUpViewController.h
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import "ViewController.h"

@interface SignUpViewController : ViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UITextField *noteTextField;
@property (strong, nonatomic) IBOutlet UIButton *signUpButton;


- (instancetype)init;

@end
