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

    Weather *forecast;
    

NSMutableArray *weatherData;

+(NSArray *)WeatherDataFromJSON:(NSData *)weatherInfo

{
    NSArray *results = [weatherInfo valueForKey:@"list"];
    NSLog(@"Count %d", results.count);
        weatherData = [[NSMutableArray alloc] init];
    for (NSDictionary *weatherDic in results) {
        Weather    *aWeather = [[Weather alloc] init];
       
        aWeather.forecastTemp= [[weatherDic objectForKey:@"temp"]objectForKey:@"day"];
        aWeather.forecastTempmin= [[weatherDic objectForKey:@"temp"]objectForKey:@"min"];
        aWeather.forecastTempmax= [[weatherDic objectForKey:@"temp"]objectForKey:@"max"];
        
        
        
    
        aWeather.cloudCover =[[weatherDic objectForKey:@"clouds"]integerValue];
        
        aWeather.conditions = [weatherDic objectForKey:@"weather"];
        aWeather.humidity = [[weatherDic objectForKey:@"humidity"] integerValue];
        aWeather.reportTime= [NSDate dateWithTimeIntervalSince1970:[[weatherDic objectForKey:@"dt"]doubleValue]];
        aWeather.windDirection=[[weatherDic objectForKey:@"deg"]doubleValue];
        aWeather.windSpeed=[[weatherDic objectForKey:@"speed"]integerValue];
        
        
        NSLog(@"%d", aWeather.cloudCover);
        NSLog(@"%@", aWeather.conditions [0][@"description"]);
        NSLog(@"%@", aWeather.forecastTemp);
        NSLog(@"%@", aWeather.reportTime);
        [weatherData addObject:aWeather];
    }
    
    return weatherData;
}
@end


