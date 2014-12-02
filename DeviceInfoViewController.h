//
//  DeviceInfoViewController.h
//  VodaApp
//
//  Created by Daniel Stepanov on 12/1/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceInfoViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)doneButtonTouched:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIImageView *voda;
@property (weak, nonatomic) IBOutlet UIImageView *droplet;

@end
