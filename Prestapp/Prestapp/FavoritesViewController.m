//
//  FavoritesViewController.m
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        self.parseClassName = @"Favoritos";
        self.pullToRefreshEnabled = YES;
        self.objectsPerPage = 10;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Favoritos";
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    return query;
}

#pragma mark - Table view data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *reuseid = @"reuseIde";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseid];
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
    NSString *nameUser = [object objectForKey:@"nombre"];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    nameLabel.text = nameUser;
    return cell;
}


@end
