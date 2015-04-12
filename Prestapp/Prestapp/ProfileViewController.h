//
//  ProfileViewController.h
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoFacebook;
@property (weak, nonatomic) IBOutlet UILabel *nameFacebook;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonLogIn;
@property (weak, nonatomic) IBOutlet UITableView *tableSettings;
- (IBAction)logInUser:(UIBarButtonItem *)sender;
@end
