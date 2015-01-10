//
//  CurrentWeather.h
//  WeatherForecast
//
//  Created by Adenike Olatunji on 06/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
// Place and time
@property (nonatomic, copy)NSString *city;
@property (nonatomic, copy)NSString *country;
@property (nonatomic)double latitude;
@property (nonatomic)double longitude;
@property (nonatomic, copy) NSDate *reportTime;
@property (nonatomic, copy) NSDate *sunrise;
@property (nonatomic, copy) NSDate *sunset;
@property (nonatomic, copy) NSString *descriptions;
@property (nonatomic,copy) NSString *icon;
//Qualitative
@property (nonatomic,copy) NSArray *conditions;
@property (nonatomic,copy) NSArray *list;
@property (nonatomic,copy)NSNumber *forecastTemp;
@property (nonatomic,copy) NSArray *forecastTempmax;
@property (nonatomic,copy) NSArray *forecastTempmin;
// Qualitative
@property (nonatomic) NSInteger cloudCover;
@property (nonatomic) NSInteger humidity;
@property (nonatomic) NSInteger pressure;
@property (nonatomic) NSInteger rain3hours;
@property (nonatomic) NSInteger snow3hours;
@property (nonatomic) double tempCurrent;
@property (nonatomic) double tempMin;
@property (nonatomic) double tempMax;
@property (nonatomic) NSInteger windDirection;
@property (nonatomic) double windSpeed;

@property NSDictionary *weatherServiceResponse;
@property NSDictionary *fiveDaysWeatherServiceResponse;
@property NSDictionary *weatherDic;
@property NSMutableArray *weatherData;

// Methods

-(void)parseWeatherServiceResponse;

-(double)kelvinToCelsius:(double)degreesKelvin;


@end
