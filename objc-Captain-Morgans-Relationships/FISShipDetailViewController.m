//
//  FISShipDetailViewController.m
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "FISShipDetailViewController.h"
#import "Pirate.h"
#import "Engine.h"

@interface FISShipDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *shipNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pirateNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *propTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hpLabel;
@property (weak, nonatomic) IBOutlet UILabel *sailSizeLabel;

@end

@implementation FISShipDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.shipNameLabel setText:self.ship.name ? self.ship.name : @"(untitled ship)"];
    [self.pirateNameLabel setText:self.ship.pirate.name];
    [self.propTypeLabel setText:self.ship.engine.propulsionType];
//    [self.hpLabel setText:<#(NSString * _Nullable)#>];
//    [self.sailSizeLabel setText:<#(NSString * _Nullable)#>];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
