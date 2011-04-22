//
//  RootViewController.m
//  NPGesturedViewController
//
//  Created by Nick Parfene on 22/04/11.
//  Copyright 2011 tmro ltd. All rights reserved.
//

#import "RootViewController.h"

#import "ExampleViewController.h"

@implementation RootViewController

@synthesize arrayOfDatasourceItems;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrayOfDatasourceItems = [NSMutableArray array];
        
        self.navigationItem.title = @"Top level";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //-- add three mock objects
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Text placeholder 1", @"first_property", @"Text description 1", @"second_property", nil];
    [self.arrayOfDatasourceItems addObject:dictionary];
    
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Text placeholder 2", @"first_property", @"Text description 2", @"second_property", nil];
    [self.arrayOfDatasourceItems addObject:dictionary];
    
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Text placeholder 3", @"first_property", @"Text description 3", @"second_property", nil];
    [self.arrayOfDatasourceItems addObject:dictionary];    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}


// Customize the number of sections in the table view.
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayOfDatasourceItems count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Configure the cell.
    NSDictionary *dictionary = [self.arrayOfDatasourceItems objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictionary objectForKey:@"first_property"];
    cell.detailTextLabel.text = [dictionary objectForKey:@"second_property"];    
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleViewController *exampleViewController = [[ExampleViewController alloc] initWithNibName:@"ExampleViewController"
                                                                                           bundle:[NSBundle mainBundle]
                                                                                  datasourceItems:self.arrayOfDatasourceItems
                                                                                     currentIndex:indexPath.row];
    [self.navigationController pushViewController:exampleViewController animated:YES];
    [exampleViewController release];
}

- (void) didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void) viewDidUnload {
    [super viewDidUnload];
    
    [arrayOfDatasourceItems removeAllObjects];
}

- (void) dealloc {
    [arrayOfDatasourceItems release];
    arrayOfDatasourceItems = nil;
    
    [super dealloc];
}

@end
