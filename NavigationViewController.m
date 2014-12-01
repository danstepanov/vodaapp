//
//  NavigationViewController.m
//  VodaApp
//
//  Created by Daniel Stepanov on 12/1/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import "NavigationViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewWillAppear:(BOOL)animated {
    
    PFUser *user = [PFUser currentUser];
    [PFUser logOut];
    
    if (user == nil) {
        NSLog(@"They need to make a new account");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *login = [storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController pushViewController:login animated:YES];
        
    } else {
        NSLog(@"User has an account");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController pushViewController:home animated:YES];

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
