//
//  ProfileViewController.m
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if([PFUser currentUser])
    {
        self.buttonLogIn.title = @"Log Out";
    }
    else
        self.buttonLogIn.title = @"Log In";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logInUser:(UIBarButtonItem *)sender
{
    if([sender.title isEqualToString:@"Log In"]){
        NSArray *permissionsArray = @[@"public_profile"];
        [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
            if(!user){
                NSString *errorMessage = nil;
                if(!error)
                {
                    NSLog(@"The user has cancelled the Facebook login");
                    errorMessage = @"Uh oh. The user cancelled the Facebook login.";
                }
                else
                {
                    NSLog(@"An error has occured: %@", error);
                    errorMessage = [error.userInfo objectForKey:@"error"];
                }
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:[error.userInfo objectForKey:@"error"] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
            else
            {
                if(user.isNew){
                    
                }
                else{
                    
                }
                FBRequest *request = [FBRequest requestForMe];
                [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                    if(!error)
                    {
                        NSDictionary *userData = (NSDictionary *)result;
                        NSString *facebookUserName = [userData objectForKey:@"name"];
                        NSString *facebookID = [userData objectForKey:@"id"];
                        NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                        self.buttonLogIn.title = @"Log Out";
                    }
                }];
            }
        }];
    }
    else
    {
        [PFUser logOut];
        self.buttonLogIn.title = @"Log In";
    }
    
    
}
@end
































