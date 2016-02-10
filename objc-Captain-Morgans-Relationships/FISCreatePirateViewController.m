//
//  FISCreatePirateViewController.m
//  objc-Captain-Morgans-Relationships
//
//  Created by Ken M. Haggerty on 2/10/16.
//  Copyright © 2016 Zachary Drossman. All rights reserved.
//

#import "FISCreatePirateViewController.h"
#import "Pirate.h"
#import "FISPiratesDataStore.h"

@interface FISCreatePirateViewController ()
@property (nonatomic, strong) IBOutlet UITextField *textField;
- (IBAction)cancel:(id)sender;
- (IBAction)createPirate:(id)sender;
@end

@implementation FISCreatePirateViewController

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

- (IBAction)createPirate:(id)sender
{
    NSString *name = self.textField.text;
    
    FISPiratesDataStore *store = [FISPiratesDataStore sharedPiratesDataStore];
    Pirate *pirate = [NSEntityDescription insertNewObjectForEntityForName:@"Pirate" inManagedObjectContext:store.managedObjectContext];
    [pirate setName:name];
    
    [store saveContext];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
