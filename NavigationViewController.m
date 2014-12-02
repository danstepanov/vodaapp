//
//  NavigationViewController.m
//  VodaApp
//
//  Created by Daniel Stepanov on 12/1/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import "NavigationViewController.h"
#import "HomeViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    PFUser *user = [PFUser currentUser];
    [PFUser logOut];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (user == nil) {
            NSLog(@"They need to make a new account");
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
        }
    });
    
    // since each navigation controller has a root VC relationship
    // as defined in the storyboard, nothing else needs to be done.
}

- (IBAction)unwindToNavigation:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"unwound to navigation");
    HomeViewController *vc =
        ([self.topViewController isKindOfClass:[HomeViewController class]])
        ? (HomeViewController *)self.topViewController : nil;
    if (vc != nil) {
        [vc presentSyncDeviceViewController];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
