//
//  ViewController.m
//  VodaApp
//
//  Created by Daniel Stepanov on 11/30/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import "HomeViewController.h"
#import "SyncDeviceViewController.h"
#import "DeviceInfoViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface HomeViewController ()

@property (readwrite, nonatomic, getter=isAppearing) BOOL appeared;
@property (strong, nonatomic) NSString *queuedSegueIdentifer;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.queuedSegueIdentifer != nil) {
        self.appeared = NO;
        [self performSegueWithIdentifier:self.queuedSegueIdentifer sender:self];
        self.queuedSegueIdentifer = nil;
    } else {
        self.appeared = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.appeared = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentSyncDeviceViewController {
    NSLog(@"presenting sync device view controller");
    self.appeared = NO;
    self.queuedSegueIdentifer = @"sync-device";
}

- (void)presentDeviceInfoViewController {
    NSLog(@"presenting device info view controller");
    self.queuedSegueIdentifer = @"device-info";
}

- (void)setQueuedSegueIdentifer:(NSString *)queuedSegueIdentifer {
    if ([self isAppearing] && (queuedSegueIdentifer != nil)) {
        self.appeared = NO;
        [self performSegueWithIdentifier:queuedSegueIdentifer sender:self];
    } else {
        [self willChangeValueForKey:@"queuedSegueIdentifier"];
        _queuedSegueIdentifer = queuedSegueIdentifer;
        [self didChangeValueForKey:@"queuedSegueIdentifier"];
    }
}

- (IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue {
    if ([unwindSegue.sourceViewController isKindOfClass:[SyncDeviceViewController class]])
    {
        [self presentDeviceInfoViewController];
    }
    else if ([unwindSegue.sourceViewController isKindOfClass:[DeviceInfoViewController class]])
    {
        NSLog(@"HomeVC modal process completed");
    }
    else
    {
        // do something when any other view controller dismisses a modal or unwinds another segue
    }
    
    return;
}

- (IBAction)facebookLogOutTouched:(id)sender {
    [PFUser logOut]; // Log out
    
    // Return to Login view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
