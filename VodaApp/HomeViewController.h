//
//  ViewController.h
//  VodaApp
//
//  Created by Daniel Stepanov on 11/30/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *tourImageButton;

- (IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue;
- (IBAction)facebookLogOutTouched:(id)sender;

- (void)presentSyncDeviceViewController;

@end

