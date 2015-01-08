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
//NSDictionary *_weatherDic;

-(id)init
{
    self = [super init];
    _weatherServiceResponse =@{};
    _fiveDaysWeatherServiceResponse=@{};
    _weatherDic=@{};
    
   
    return self;
}
    



-(void)parseWeatherServiceResponse{
    NSLog(@" I am in the current%@", _weatherServiceResponse);
    // clouds
    _cloudCover  = [_weatherServiceResponse [@"clouds"][@"all"] integerValue];
    NSLog(@"%d@" , _cloudCover);
    //coordinates
    _latitude = [_weatherServiceResponse [@"coord"][@"lat"] doubleValue];
    _longitude = [_weatherServiceResponse [@"coord"][@"lon"] doubleValue];
    
    // current time
    _reportTime =[NSDate dateWithTimeIntervalSince1970:[_weatherServiceResponse[@"dt"]doubleValue]];
    
    //main
    _humidity=[_weatherServiceResponse [@"main"][@"humidity"]integerValue];
    _pressure=[_weatherServiceResponse [@"main"][@"pressure"]integerValue];
    _tempCurrent=[Weather kelvinToCelsius:[_weatherServiceResponse[@"main"][@"temp"]doubleValue]];
    _tempMin=[Weather kelvinToCelsius:[_weatherServiceResponse[@"main"][@"temp_min"]doubleValue]];
    _tempMax=[Weather kelvinToCelsius:[_weatherServiceResponse[@"main"][@"temp_max"]doubleValue]];
    
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


-(void)parseWeatherServiceResponseForecast{
  
    
    NSArray *results = [_fiveDaysWeatherServiceResponse valueForKey:@"list"];
    NSLog(@"Count %d", results.count);
    _weatherData = [[NSMutableArray alloc] init];
    
    for (NSDictionary *weatherDic in results) {
        
        [_weatherData addObject:weatherDic];
    }
    
        
    // clouds
     _cloudCover  = [_weatherDic[@"cloud"][@"all"] integerValue];
    
    // current time
    _reportTime =[NSDate dateWithTimeIntervalSince1970:[_weatherDic[@"dt"]doubleValue]];
    
    //main
    _humidity=[_weatherDic [@"humidity"]integerValue];
    _pressure=[_weatherDic [@"pressure"]integerValue];
    _tempCurrent=[Weather kelvinToCelsius:[_weatherDic[@"temp"][@"day"]doubleValue]];
    _tempMin=[Weather kelvinToCelsius:[_weatherDic[@"temp"][@"min"]doubleValue]];
    _tempMax=[Weather kelvinToCelsius:[_weatherDic[@"temp"][@"max"]doubleValue]];
    
    //weather
    _conditions= _weatherDic[@"weather"];
   
    //wind
    _windSpeed=[_weatherDic[@"speed"]doubleValue];
    _windDirection= [_weatherDic[@"deg"]doubleValue];
    

}

+(double)kelvinToCelsius:(double)degreesKelvin
{
    const double  ZERO_CELSIUS_IN_KELVIN = 273.15;
    return degreesKelvin - ZERO_CELSIUS_IN_KELVIN;
}





@end


