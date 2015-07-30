//
//  ATMDetailViewController.m
//  JPMorganChaseSample
//
//  Created by Fiseha Gezahegn on 7/29/15.
//  Copyright (c) 2015 FisehaGezahegn. All rights reserved.
//

#import "ATMDetailViewController.h"

@interface ATMDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) UIImageView *imgView;
@end

@implementation ATMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = _passedDict[@"name"];
    _nameLabel.text = [NSString stringWithFormat:@"Name: %@", _passedDict[@"name"]];
    _locTypeLabel.text = [NSString stringWithFormat:@"Location Type : %@", _passedDict[@"locType"]];
   _distanceLabel.text = [NSString stringWithFormat:@"Distance: %@ miles", _passedDict[@"distance"]];
    _addressLabel.text = [NSString stringWithFormat:@"Address: %@\n%@, %@ %@", _passedDict[@"address"], _passedDict[@"city"], _passedDict[@"state"], _passedDict[@"zip"]];
    
    CAGradientLayer *viewLayer = [CAGradientLayer layer];
    viewLayer.frame = self.view.bounds;
    viewLayer.colors = [NSArray arrayWithObjects:
                        (id)[[UIColor darkGrayColor] CGColor],
                        (id)[[UIColor darkTextColor] CGColor],
                        nil];
    [self.view.layer insertSublayer:viewLayer atIndex:0];
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
