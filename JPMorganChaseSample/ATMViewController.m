//
//  ATMViewController.m
//  JPMorganChaseSample
//
//  Created by Fiseha Gezahegn on 7/29/15.
//  Copyright (c) 2015 FisehaGezahegn. All rights reserved.
//

#import "ATMViewController.h"
#import "ATMDetailViewController.h"
#import "MapViewController.h"
#import "MBProgressHUD.h"

@interface ATMViewController ()

@property (strong, nonatomic) NSArray *locations;

@property (strong, nonatomic) MBProgressHUD *hud;
@end

@implementation ATMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //_locations = [[NSMutableArray alloc]init];
    ATMModel *model = [[ATMModel alloc]init];
    [model getItems];
    model.delegate = self;
    [self loadingOverlay];
}

-(void)loadingOverlay
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading ATM Locations";
}

-(void)hideOverlay
{
    [_hud hide:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)itemsRetrieved:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _locations = items;
    // Reload the table view
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_locations count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ATMCell"];
    
    NSDictionary *locationAtIndex = _locations[indexPath.row];
    
    cell.textLabel.text = locationAtIndex[@"name"];
    
    cell.detailTextLabel.text = locationAtIndex[@"locType"];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.destinationViewController isKindOfClass:[ATMDetailViewController class]])
    {
        // Create an instance of ATMDetailViewController and set it as segue's destination view controller.
        ATMDetailViewController *advc = (ATMDetailViewController *)segue.destinationViewController;
        
        // Assign the selected row of the tableview to an instance of NSIndexPath.
        NSIndexPath *indexPath = [_tableView indexPathForSelectedRow];
        
        // Assign the dictionary object at the index of the array to a variable called selectedDict of type NSDictionary.
        NSDictionary *selectedDict = _locations[indexPath.row];
        
        // Set the passedDict property of the ATMDetailViewController to selectedDict.
        advc.passedDict = selectedDict;
    }
    
    else if([segue.destinationViewController isKindOfClass:[MapViewController class]])
    {
        // Set the MapViewController instance as the segue's destination view controller.
        MapViewController *mvc = (MapViewController *)segue.destinationViewController;
        
        mvc.locations = _locations;
    }
}

@end
