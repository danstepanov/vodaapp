//
//  LoginViewController.h
//  VodaApp
//
//  Created by Daniel Stepanov on 12/1/14.
//  Copyright (c) 2014 Daniel Stepanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)facebookButtonTouched:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;


@end
