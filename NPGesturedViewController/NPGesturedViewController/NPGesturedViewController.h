//
//  NPGesturedViewController.h
//  NPGesturedViewController
//
//  Created by Nick Parfene on 22/04/11.
//  Copyright 2011 tmro ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NPGesturedViewController : UIViewController {
    NSArray *arrayOfDatasourceItems;
    NSInteger currentIndex;
}

@property (nonatomic, retain) NSArray *arrayOfDatasourceItems;
@property (nonatomic, assign) NSInteger currentIndex;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil datasourceItems:(NSArray *)arrayOfDatasourceItems currentIndex:(NSInteger)currentIndex;

- (void) configureView;

@end
