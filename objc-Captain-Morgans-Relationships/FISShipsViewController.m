//
//  FISShipsViewController.m
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "FISShipsViewController.h"
#import "Ship.h"
#import "FISShipDetailViewController.h"
#import "FISAddShipViewController.h"
#import "FISPiratesDataStore.h"

@interface FISShipsViewController ()
@property (nonatomic, strong) NSArray *ships;
@property (nonatomic, strong) FISPiratesDataStore *store;
@end

@implementation FISShipsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FISPiratesDataStore *store = [FISPiratesDataStore sharedPiratesDataStore];
    [self setStore:store];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.store fetchData];
    Pirate *pirate = [self.store.pirates filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name == %@", self.pirate.name]].lastObject;
    [self setPirate:pirate];
    [self setShips:self.pirate.ships.allObjects];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ships.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"shipCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Ship *ship = self.ships[indexPath.row];
    [cell.textLabel setText:ship.name ? ship.name : @"(untitled ship)"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addShip"]) {
        FISAddShipViewController *addShipViewController = (FISAddShipViewController *)segue.destinationViewController;
        [addShipViewController setPirate:self.pirate];
        return;
    }
    
    if (![segue.identifier isEqualToString:@"showShipDetails"]) return;
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    Ship *ship = self.ships[indexPath.row];
    
    FISShipDetailViewController *detailViewController = (FISShipDetailViewController *)segue.destinationViewController;
    [detailViewController setShip:ship];
}

@end
