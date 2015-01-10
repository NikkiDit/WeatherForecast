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
#import "WeatherCell.h"
#import "CurrentWeatherViewController.h"


@interface ForecastTableViewController ()

@property NSData *weatherDataReceived;

@end

@implementation ForecastTableViewController


{
    Weather *theWeatherForecast;
    CurrentWeatherViewController *mycurent;
}


NSString  *icon = @"http://openweathermap.org/img/w/";

//NSString  *query;

NSArray  *parsedWeatherData;
- (void)viewDidLoad {
    [super viewDidLoad];
  
    theWeatherForecast =[[Weather alloc]init];
   
   self.weatherDataReceived= [[NSData alloc] init];

   
    
    
   }




-(void) loadWeatherData: (NSString *)query{
    NSString *weatherURLText = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=5",query];
    NSLog(@"%@",query);
   
    
    NSURL *weatherURL = [NSURL URLWithString:weatherURLText];
    NSURLRequest *weatherRequest = [NSURLRequest requestWithURL:weatherURL];
    
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:weatherRequest];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"%@", responseObject);
      self.weatherDataReceived =(NSData *) responseObject;
        
        parsedWeatherData=[WeatherForecastData WeatherDataFromJSON:self.weatherDataReceived];
          [self.tableView reloadData];
        
        
        
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
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return parsedWeatherData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   WeatherCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCell" forIndexPath:indexPath];
    
    Weather  *weatherData =[parsedWeatherData objectAtIndex:indexPath.row];
    
    
    double tempday =[[NSString stringWithFormat: @"%@", weatherData.forecastTemp]doubleValue];
    tempday = [theWeatherForecast kelvinToCelsius:tempday];
    double tempMax =[[NSString stringWithFormat: @"%@", weatherData.forecastTempmax]doubleValue];
    tempMax = [theWeatherForecast kelvinToCelsius:tempMax];
    
    
    double tempMin =[[NSString stringWithFormat: @"%@", weatherData.forecastTempmin]doubleValue];
    tempMin = [theWeatherForecast kelvinToCelsius:tempMin];
    
    cell.tempday.text =[NSString stringWithFormat: @"%2.1f C" ,tempday];
   
    
    cell.humidity.text = [NSString stringWithFormat: @"Humidity: %d %%" , weatherData.humidity];
    
    
    cell.reportTime.text =[[NSString stringWithFormat:@"%@", weatherData.reportTime]substringToIndex:10];
    
    cell.tempMax.text =[NSString stringWithFormat: @"Maximum: %2.1f C" , tempMax];
   
    cell.tempMin.text=[NSString stringWithFormat: @"Minimum: %2.1f C" , tempMin];
    
    cell.speed.text = [NSString stringWithFormat: @"Wind Speed: %2.1f m/s" , weatherData.windSpeed];
    
    //cell.cloud.text = [NSString stringWithFormat:@"%d", weatherData.cloudCover];
    
    cell.condition.text=[NSString stringWithFormat: @"%@", weatherData.conditions[0][@"description"]];
    if (weatherData.conditions[0][@"icon"] != nil)
    {
        
        
    NSString *iconUrl_String= [icon stringByAppendingString:weatherData.conditions[0][@"icon"]];
        
        iconUrl_String= [iconUrl_String stringByAppendingString:@".png"];
        
         cell.icon.image =  [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:iconUrl_String ]]];
    }
 
    return cell;
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
