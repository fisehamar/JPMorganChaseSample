//
//  MapViewController.h
//  JPMorganChaseSample
//
//  Created byFiseha Gezahegn on 7/30/15.
//  Copyright (c) 2015 FisehaGezahegn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDictionary *passedDict;

@end
