//
//  FeedViewController.m
//  
//
//  Created by Abner Castro Aguilar on 11/04/15.
//
//

#import "FeedViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        self.parseClassName = @"Prestamistas";
        self.pullToRefreshEnabled = YES;
        self.objectsPerPage = 30;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Feed";
}

#pragma mark Parse Table View

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    return query;
}


@end






































