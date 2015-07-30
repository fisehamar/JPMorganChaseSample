//
//  MapViewController.m
//  JPMorganChaseSample
//
//  Created by Fiseha Gezahegn on 7/30/15.
//  Copyright (c) 2015 FisehaGezahegn. All rights reserved.
//
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    CLLocationCoordinate2D poiCoodinates;
    // Plot pins
    for(NSDictionary *dict in _locations){
        // Create coordinates from location lat/long
        poiCoodinates.latitude = [dict[@"lat"]doubleValue];
        poiCoodinates.longitude= [dict[@"lng"]doubleValue];
        MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
        pin.coordinate = poiCoodinates;
        [self.map addAnnotation:pin];
    }
    
    //Instantiate a location object.
    self.locationManager = [[CLLocationManager alloc] init];
    //Make this controller the delegate for the location manager.
    [self.locationManager setDelegate:self];
    
#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    [self.locationManager startUpdatingLocation];
    
    // Initialize a MKMapRect variable to null.
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in _map.annotations)
    {
        // For each MKAnnotation in the mapview's annotions array, create an annotation point for the annotation's coordinate.
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        
        //Then create a rectangle based on the annotationPoint's size and position.
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
        
        // Join the annotation point's rectangle and the zoom rectangle.
        zoomRect = MKMapRectUnion(zoomRect, pointRect);
    }
    
    // Set the visible rectanlge of the map.
    [_map setVisibleMapRect:zoomRect animated:YES];
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

@end
