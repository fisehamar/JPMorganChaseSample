//
//  JMHomeModel.h
//  HomePlaces
//
//  Created by Fiseha Gezahegn on 7/30/14.
//  Copyright (c) 2014 FisehaGezahegn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@protocol ATMModelDelegate <NSObject>

- (void)itemsRetrieved:(NSArray *)items;

-(void)loadingOverlay;

-(void)hideOverlay;

@end

@interface ATMModel : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property (nonatomic, weak) id<ATMModelDelegate> delegate;

- (void)getItems;

@property (strong, nonatomic) Location *myLocation;

@end
