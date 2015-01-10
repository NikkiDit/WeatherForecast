//
//  CurrentWeather.m
//  WeatherForecast
//
//  Created by Adenike Olatunji on 06/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import "Weather.h"
#import "AFNetworking.h"

@implementation Weather


-(id)init
{
    self = [super init];
    _weatherServiceResponse =@{};
    _fiveDaysWeatherServiceResponse=@{};
    
    _weatherDic=@{};
    
   
    return self;
}
    



-(void)parseWeatherServiceResponse{
       // clouds
    _cloudCover  = [_weatherServiceResponse [@"clouds"][@"all"] integerValue];
       //coordinates
    _latitude = [_weatherServiceResponse [@"coord"][@"lat"] doubleValue];
    _longitude = [_weatherServiceResponse [@"coord"][@"lon"] doubleValue];
    
    // current time
    _reportTime =[NSDate dateWithTimeIntervalSince1970:[_weatherServiceResponse[@"dt"]doubleValue]];
    
    //main
    _humidity=[_weatherServiceResponse [@"main"][@"humidity"]integerValue];
    _pressure=[_weatherServiceResponse [@"main"][@"pressure"]integerValue];
    _tempCurrent=[self kelvinToCelsius:[_weatherServiceResponse[@"main"][@"temp"]doubleValue]];
    _tempMin=[self kelvinToCelsius:[_weatherServiceResponse[@"main"][@"temp_min"]doubleValue]];
    _tempMax=[self kelvinToCelsius:[_weatherServiceResponse[@"main"][@"temp_max"]doubleValue]];
    
    // name
    _city=_weatherServiceResponse[@"name"];
    
    //rain
    _rain3hours=[_weatherServiceResponse[@"rain"][@"3h"]integerValue];
    //snow
    _snow3hours=[_weatherServiceResponse[@"snow"][@"3h"]integerValue];
    
    //sys
    _country= _weatherServiceResponse[@"sys"][@"country"];
    _sunrise= [NSDate dateWithTimeIntervalSince1970:[_weatherServiceResponse[@"sys"][@"sunrise"]doubleValue]];
    _sunset=[NSDate dateWithTimeIntervalSince1970:[_weatherServiceResponse[@"sys"][@"sunset"]doubleValue]];
    
    //weather
    _conditions= _weatherServiceResponse[@"weather"];
    
    //wind
    _windDirection=[_weatherServiceResponse[@"wind"][@"dir"]integerValue];
    _windSpeed=[_weatherServiceResponse[@"wind"][@"speed"]doubleValue];
}
/*

-(void)parseWeatherServiceResponseForecast{
  
    
    NSArray *results = [_fiveDaysWeatherServiceResponse valueForKey:@"list"];
    NSLog(@"Count %d", results.count);
    _weatherData = [[NSMutableArray alloc] init];
    
    
    for (NSDictionary *weatherDic in results) {
        Weather    *aWeather = [[Weather alloc] init];
        aWeather.tempCurrent = [[weatherDic objectForKey:@"temp"]doubleValue];
        aWeather.tempMax = [[weatherDic objectForKey:@"temp"]doubleValue];
        aWeather.tempMin = [[weatherDic objectForKey:@"temp"]doubleValue];
        aWeather.cloudCover =[[weatherDic objectForKey:@"cloud"]integerValue];
        
        aWeather.conditions = [weatherDic objectForKey:@"weather"];
       aWeather.humidity = [[weatherDic objectForKey:@"humidity"] integerValue];
        aWeather.reportTime= [NSDate dateWithTimeIntervalSince1970:[[weatherDic objectForKey:@"dt"]doubleValue]];
        aWeather.windDirection=[[weatherDic objectForKey:@"deg"]doubleValue];
        aWeather.windSpeed=[[weatherDic objectForKey:@"speed"]integerValue];
        [_weatherData addObject:aWeather];
    }
    
}
 */

-(double)kelvinToCelsius:(double)degreesKelvin
{
    const double  ZERO_CELSIUS_IN_KELVIN = 273.15;
    return degreesKelvin - ZERO_CELSIUS_IN_KELVIN;
}





@end


