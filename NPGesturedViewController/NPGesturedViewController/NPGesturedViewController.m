//
//  NPGesturedViewController.m
//  NPGesturedViewController
//
//  Created by Nick Parfene on 22/04/11.
//  Copyright 2011 tmro ltd. All rights reserved.
//

#import "NPGesturedViewController.h"

@interface NPGesturedViewController () 
- (void)swipeGestureOccurred:(UISwipeGestureRecognizer *)recognizer;
@end

@implementation NPGesturedViewController

@synthesize arrayOfDatasourceItems;
@synthesize currentIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil datasourceItems:(NSArray *)arrayOfDatasourceItems_ currentIndex:(NSInteger)currentIndex_ {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrayOfDatasourceItems = arrayOfDatasourceItems_;
        self.currentIndex = currentIndex_;
    }
    return self;
}

- (void) dealloc {
    [super dealloc];
    
    [arrayOfDatasourceItems release];
    arrayOfDatasourceItems = nil;
}

- (void) didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle -

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                 action:@selector(swipeGestureOccurred:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    //-- please note that Apple does not respect the contract in their header file for the direction property. Sadly only one direction can be used per gesture recogniser
    swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                       action:@selector(swipeGestureOccurred:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    [swipeGestureRecognizer release];
    
}


- (void) viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)swipeGestureOccurred:(UISwipeGestureRecognizer *)recognizer {
    
    BOOL shouldConfigureView = NO;
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Swiped Left. Going forwards");
        if (currentIndex + 1 < [self.arrayOfDatasourceItems count]) {
            currentIndex += 1;
            shouldConfigureView = YES;
        }
    }
    else {
        NSLog(@"Swiped right. Going backwards");
        if (currentIndex > 0) {
            currentIndex -= 1;
            shouldConfigureView = YES;
        }
    }
    
    if (shouldConfigureView) {
        [self configureView];
    }
    else {
        //-- shake the UI a bit
    }
}

#pragma mark - Abstract methods - 
- (void) configureView {
    [NSException raise:@"Invalid call" format:@"You must only call this method on a subclass. You called it on %@", [self class]];
}

@end
