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

@interface HomeViewController () <UIAlertViewDelegate>

@property (readwrite, nonatomic) BOOL needsTour;
@property (readwrite, nonatomic) int tourStep;

@property (readwrite, nonatomic, getter=isAppearing) BOOL appeared;

@property (strong, nonatomic) NSString *queuedSegueIdentifer;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // MUST CHANGE NEEDS TOUR
    self.needsTour = YES;
    self.tourStep = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.queuedSegueIdentifer != nil) {
        self.appeared = NO;
        [self performSegueWithIdentifier:self.queuedSegueIdentifer sender:self];
        self.queuedSegueIdentifer = nil;
    } else {
        self.appeared = YES;
        
        if (self.needsTour) {
            [self startTour];
            self.needsTour = NO;
        }
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

#pragma mark - Tour

- (void)startTour {
    NSLog(@"tour should start");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Yay! You're back!"
                                                    message:@"Let's get you up and running with a quick tour of the voda app. If you'd like to skip the tour, just press 'Skip' below."
                                                   delegate:self cancelButtonTitle:@"Skip" otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)continueTour {
    self.tourStep = self.tourStep + 1;
    if (self.tourStep > 9) return;
    
    NSString *resource = [NSString stringWithFormat:@"step%d", self.tourStep];
    UIImage *image = [UIImage imageNamed:resource];
    self.imageView.image = image;
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"index: %lu", buttonIndex);
    if (buttonIndex == 0) {
        // cancel
    } else if (buttonIndex == 1) {
        [self continueTour];
    }
}

#pragma mark - Actions

- (IBAction)facebookLogOutTouched:(id)sender {
    [PFUser logOut]; // Log out
    
    // Return to Login view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
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

- (IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue {
    if ([unwindSegue.sourceViewController isKindOfClass:[SyncDeviceViewController class]])
    {
        [self presentDeviceInfoViewController];
    }
    else if ([unwindSegue.sourceViewController isKindOfClass:[DeviceInfoViewController class]])
    {
        self.needsTour = YES;
    }
    else
    {
        // do something when any other view controller dismisses a modal or unwinds another segue
    }
    
    return;
}

#pragma mark - SEM: Queued Segues

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

@end
