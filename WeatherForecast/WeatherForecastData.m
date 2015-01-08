//
//  WeatherForecastData.m
//  WeatherForecast
//
//  Created by Adenike Olatunji on 07/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import "WeatherForecastData.h"
#import "Weather.h"

@implementation WeatherForecastData

NSDictionary *weatherDictionary;


+(NSArray *)WeatherDataFromJSON:(NSData *)weatherInfo

{

    NSLog(@"%@",weatherInfo);
    NSError *dataError = nil;
    NSDictionary *parsedWeatherForecast=[NSJSONSerialization JSONObjectWithData:weatherInfo options:kNilOptions error:&dataError];
    
   
    
  NSArray *forecastData = [parsedWeatherForecast objectForKey:@"city"];
    return forecastData;
   
}
@end


