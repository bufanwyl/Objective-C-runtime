//
//  DetailViewController.h
//  Objective-C runtime
//
//  Created by Brooklyn on 2/4/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
