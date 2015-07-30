//
//  JMHomeModel.m
//  HomePlaces
//
//  Created by Fiseha Gezahegn on 7/30/14.
//  Copyright (c) 2014 FisehaGezahegn. All rights reserved.
//

#define api_key @"8f4hsgmepwt6ybh4z2exefrr"

#import "ATMModel.h"

@interface ATMModel()
{
    NSMutableData *retrievedData;
}
@end

@implementation ATMModel

- (void)getItems
{
    NSString *urlString = @"https://m.chase.com/PSRWeb/location/list.action?lat=33.748995&lng=-84.387982";
    NSLog(@"%@", urlString);
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:urlString];
    // Create the request
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    //[urlRequest setHTTPMethod:@"GET"];
    [urlRequest setURL:jsonFileUrl];
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    [self.delegate loadingOverlay];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    retrievedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [retrievedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSArray *_locations = [[NSArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    
    // Type to id and allow determination of type at runtime
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:retrievedData options:NSJSONReadingAllowFragments error:&error];
    
    _locations = jsonDict[@"locations"] ;
    
        for (int i = 0; i < _locations.count; i++)
        {
            NSDictionary *jsonElement = _locations[i];
            
            // Create a new location object and set its props to JsonElement properties
            Location *newLocation = [[Location alloc] init];
            newLocation.name = jsonElement[@"name"];
            newLocation.address = jsonElement[@"distance"];
            newLocation.latitude = jsonElement[@"locType"];
            newLocation.longitude = jsonElement[@"address"];
        }
    
    [self.delegate itemsRetrieved:_locations];
    [self.delegate hideOverlay];
}

@end
