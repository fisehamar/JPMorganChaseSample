//
//  ATMViewController.h
//  JPMorganChaseSample
//
//  Created by Fiseha Gezahegn on 7/29/15.
//  Copyright (c) 2015 FisehaGezahegn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Location.h"
#import "ATMModel.h"

@interface ATMViewController : UIViewController<ATMModelDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Location *location;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
