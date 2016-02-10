//
//  FISAddShipViewController.m
//  objc-Captain-Morgans-Relationships
//
//  Created by Ken M. Haggerty on 2/10/16.
//  Copyright © 2016 Zachary Drossman. All rights reserved.
//

#import "FISAddShipViewController.h"
#import "Ship.h"
#import "Engine.h"
#import "FISPiratesDataStore.h"

@interface FISAddShipViewController ()
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)cancel:(id)sender;
- (IBAction)addShip:(id)sender;
@end

@implementation FISAddShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addShip:(id)sender
{
    NSString *name = self.textField.text;
    NSString *propulsionType = [self.segmentedControl titleForSegmentAtIndex:self.segmentedControl.selectedSegmentIndex];
    
    FISPiratesDataStore *store = [FISPiratesDataStore sharedPiratesDataStore];
    Engine *engine = [NSEntityDescription insertNewObjectForEntityForName:@"Engine" inManagedObjectContext:store.managedObjectContext];
    [engine setPropulsionType:propulsionType];
    Ship *ship = [NSEntityDescription insertNewObjectForEntityForName:@"Ship" inManagedObjectContext:store.managedObjectContext];
    [ship setName:name];
    [ship setEngine:engine];
    [ship setPirate:self.pirate];
    
    [store saveContext];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
