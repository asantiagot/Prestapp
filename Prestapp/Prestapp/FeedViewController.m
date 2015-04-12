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
        self.parseClassName = @"Prestamista";
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

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *reuseIde = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIde];
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIde];
    //Configure the cell
    NSString *need = [object objectForKey:@"necesita"];
    UILabel *needLabel = (UILabel *)[cell viewWithTag:1];
    needLabel.text = need;
    NSString *personaName = [object objectForKey:@"name"];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    nameLabel.text = personaName;
    NSNumber *precio = [object objectForKey:@"precio"];
    NSString *precioString = [precio stringValue];
    UILabel *precioLabel = (UILabel *)[cell viewWithTag:3];
    precioLabel.text = precioString;
    NSNumber *tasa = [object objectForKey:@"tasa"];
    NSString *tasaString = [tasa stringValue];
    UILabel *tasaLabel = (UILabel *)[cell viewWithTag:4];
    tasaLabel.text = tasaString;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"prestaDetail" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end






































