//
//  HistoryViewController.m
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        self.parseClassName = @"Historial";
        self.pullToRefreshEnabled = YES;
        self.objectsPerPage = 15;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Historial";
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *reuse = @"reuseIde";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    NSString *name = [object objectForKey:@"usuario"];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    nameLabel.text = name;
    return cell;
}

@end
