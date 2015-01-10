//
//  CurrentWeatherViewController.m
//  WeatherForecast
//
//  Created by Adenike Olatunji on 06/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import "CurrentWeatherViewController.h"
#import "Weather.h"
#import "AFNetworking.h"
#import "ForecastTableViewController.h"


@interface CurrentWeatherViewController ()

@end

@implementation CurrentWeatherViewController
{
    Weather *theWeather;

}

//@synthesize location =_location;
NSString  *iconUrl = @"http://openweathermap.org/img/w/";
NSString  *iconUrlString = @"";


- (void)viewDidLoad {
    [super viewDidLoad];
    theWeather =[[Weather alloc]init];
}




- (IBAction)SearchWeather:(id)sender {

    
    _location = self.searchTextField.text;
    
    NSString *const BASE_URL_STRING = @"http://api.openweathermap.org/data/2.5/weather";
    
    NSString *weatherURLText = [NSString stringWithFormat:@"%@?q=%@&", BASE_URL_STRING, _location];
    NSURL *weatherURL = [NSURL URLWithString:weatherURLText];
    NSURLRequest *weatherRequest = [NSURLRequest requestWithURL:weatherURL];
    
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:weatherRequest];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
      theWeather.weatherServiceResponse =(NSDictionary *) responseObject;
        [theWeather parseWeatherServiceResponse];
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
    
    
    self.city.text =[NSString stringWithFormat:@"Weather in %@, %@\n", theWeather.city,theWeather.country];
    self.condition.text = [NSString stringWithFormat: @"%@\n", theWeather.conditions[0][@"description"]];
    self.currentTemp.text = [NSString stringWithFormat: @"%2.1f C" , theWeather.tempCurrent];
    self.windSpeed.text =[NSString stringWithFormat: @"Wind Speed: %2.1f m/s" , theWeather.windSpeed];
    self.humidity.text = [NSString stringWithFormat: @"Humidity: %d %%" , theWeather.humidity];
    NSInteger mytimeLen = [[NSString stringWithFormat: @"%@" , theWeather.reportTime] length];
    NSLog(@"%d", mytimeLen);
    if (mytimeLen>6) {
         self.reportTime.text =[[NSString stringWithFormat: @"Time: %@" , theWeather.reportTime]substringToIndex:22];
    }else{
          self.reportTime.text =[NSString stringWithFormat: @"Time: %@" , theWeather.reportTime];
    }
   
    
    
    if (theWeather.conditions[0][@"icon"] != nil)
    {
        
        
        iconUrlString= [iconUrl stringByAppendingString:theWeather.conditions[0][@"icon"]];
        
        iconUrlString= [iconUrlString stringByAppendingString:@".png"];
        
        self.icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:iconUrlString ]]];
    }
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"getLocation"]) {
     //[[segue destinationViewController]loadWeatherData:_location ];
      ForecastTableViewController *destViewController = segue.destinationViewController;
        [destViewController loadWeatherData:_location];
    }
    

}

@end
