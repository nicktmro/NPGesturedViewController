//
//  ExampleViewController.m
//  NPGesturedViewController
//
//  Created by Nick Parfene on 22/04/11.
//  Copyright 2011 tmro ltd. All rights reserved.
//

#import "ExampleViewController.h"


@implementation ExampleViewController
@synthesize labelFirstProperty;
@synthesize labelSecondProperty;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil datasourceItems:(NSArray *)arrayOfDatasourceItems_ currentIndex:(NSInteger)currentIndex_ {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil datasourceItems:arrayOfDatasourceItems_ currentIndex:currentIndex_];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    [labelFirstProperty release];
    [labelSecondProperty release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

- (void)viewDidUnload {
    [self setLabelFirstProperty:nil];
    [self setLabelSecondProperty:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - View Configuration -
- (void) configureView {
    NSDictionary *dictionary = [self.arrayOfDatasourceItems objectAtIndex:self.currentIndex];
    
    self.labelFirstProperty.text = [dictionary objectForKey:@"first_property"];
    self.labelSecondProperty.text = [dictionary objectForKey:@"second_property"];    
}

@end
