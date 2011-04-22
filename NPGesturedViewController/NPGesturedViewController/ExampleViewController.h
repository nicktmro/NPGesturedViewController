//
//  ExampleViewController.h
//  NPGesturedViewController
//
//  Created by Nick Parfene on 22/04/11.
//  Copyright 2011 tmro ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPGesturedViewController.h"

@interface ExampleViewController : NPGesturedViewController {
    
    UILabel *labelFirstProperty;
    UILabel *labelSecondProperty;
    
}

@property (nonatomic, retain) IBOutlet UILabel *labelFirstProperty;
@property (nonatomic, retain) IBOutlet UILabel *labelSecondProperty;

@end
