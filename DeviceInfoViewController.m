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
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

- (IBAction)doneButtonTouched:(id)sender {
    [self performSegueWithIdentifier:@"unwindToHomeSegue" sender:self];
}
@end
