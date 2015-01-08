//
//  ForecastTableViewController.m
//  WeatherForecast
//
//  Created by Adenike Olatunji on 06/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import "ForecastTableViewController.h"
#import "Weather.h"
#import "AFNetworking.h"
#import "WeatherForecastDelegate.m"
#import "WeatherForecastData.h"


@interface ForecastTableViewController ()
@property NSData *weatherInfo;
@property NSArray *weatherDataReceived;

@end

@implementation ForecastTableViewController


{
    Weather *theWeatherForecast;
}
NSString  *icon = @"http://openweathermap.org/img/w/";
NSString  *query =@"Dublin";

- (void)viewDidLoad {
    [super viewDidLoad];
  
    theWeatherForecast =[[Weather alloc]init];
   
   self.weatherInfo= [[NSData alloc] init];

  [self loadWeatherData:(NSString *)query];
  


}


-(void) loadWeatherData: (NSString *)query{
    NSString *weatherURLText = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=5",query];
    NSLog(@"%@",query);
    
    
    NSURL *weatherURL = [NSURL URLWithString:weatherURLText];
    NSURLRequest *weatherRequest = [NSURLRequest requestWithURL:weatherURL];
    
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:weatherRequest];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
      theWeatherForecast.fiveDaysWeatherServiceResponse =(NSDictionary *) responseObject;
    //    NSLog(@"%@",theWeatherForecast.fiveDaysWeatherServiceResponse);
      [theWeatherForecast parseWeatherServiceResponseForecast];
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error){
                                         UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"Error Retrieving Weather"
                                                                                           message:[error localizedDescription]
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"Ok"
                                                                                 otherButtonTitles:nil];
                                         [alertView show];
                                     }];
    
    [operation start];
    
      [self.tableView reloadData];
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return theWeatherForecast.weatherData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCell" forIndexPath:indexPath];
    
    Weather  *weatherData =[theWeatherForecast.weatherData objectAtIndex:indexPath.row];
    cell.textLabel.text =[NSString stringWithFormat: @"%2.1f" , theWeatherForecast.tempCurrent]  ;
 
    
    NSLog(@"%2.1f" , weatherData.tempCurrent);
    
    cell.detailTextLabel.text=[NSString stringWithFormat: @"%@\n", theWeatherForecast.conditions[0][@"description"]];
    if (theWeatherForecast.conditions[0][@"icon"] != nil)
    {
        
        
    NSString *iconUrl_String= [icon stringByAppendingString:theWeatherForecast.conditions[0][@"icon"]];
        
        iconUrl_String= [iconUrl_String stringByAppendingString:@".png"];
        
         cell.imageView.image =  [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:iconUrl_String ]]];
    }
 
    return cell;
}

#


/*
    - (void)didReceiveGroups:(NSArray *)groups
{
    _groups = groups;
    [self.tableView reloadData];
}

*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
