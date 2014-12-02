//
//  DeviceInfoViewController.m
//  VodaApp
//
//  Created by Daniel Stepanov on 12/1/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import "DeviceInfoViewController.h"

@interface DeviceInfoViewController () {
    NSArray *_pickerData;
}

@end

@implementation DeviceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Initialize Data
    _pickerData = @[@"Sink", @"Toilet", @"Shower", @"Garden Hose", @"Other"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonTouched:(id)sender {
    [self performSegueWithIdentifier:@"unwindToHomeSegue" sender:self];
}
@end
