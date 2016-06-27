//
//  ViewController.m
//  AutoLayout
//
//  Created by Cenker Demir on 6/27/16.
//  Copyright © 2016 Cenker Demir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UIButton *myLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *myRightButton;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    self.myTextView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.myTextView removeConstraints:self.myTextView.constraints];
    self.myLeftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.myLeftButton removeConstraints:self.myLeftButton.constraints];
    self.myRightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.myRightButton removeConstraints:self.myRightButton.constraints];
    
    [self.myLeftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    [self.myLeftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    
    [self.myRightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    [self.myRightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    
    [self.myTextView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
    [self.myTextView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.myTextView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    self.bottomConstraint = [self.myTextView.bottomAnchor constraintEqualToAnchor:self.myLeftButton.topAnchor constant:-20];
    self.bottomConstraint.active = YES;


}

- (void) traitCollectionDidChange: (UITraitCollection *) previousTraitCollection {
    [super traitCollectionDidChange: previousTraitCollection];
    if ((self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass)
        || (self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass)) {
        // your custom implementation here
        
        if ([[UIScreen mainScreen] bounds].size.height >= 667) {
            //if it is an iphone 6 or 6 plus then the bottom constraint is 30 portrait or landscape
            self.bottomConstraint.constant = -30;
        }
        else {
            //for everything else, we look at the orientation
            if ([[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
                //portrait
                self.bottomConstraint.constant = -20;
            }
            else {
                // landscape
                self.bottomConstraint.constant = -10;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
