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
@property (nonatomic, copy, readonly)NSString *city;
@property (nonatomic, copy, readonly)NSString *country;
@property (nonatomic, readonly)double latitude;
@property (nonatomic, readonly)double longitude;
@property (nonatomic, copy, readonly) NSDate *reportTime;
@property (nonatomic, copy, readonly) NSDate *sunrise;
@property (nonatomic, copy, readonly) NSDate *sunset;
//Qualitative
@property (nonatomic,copy,readonly) NSArray *conditions;
@property (nonatomic,copy,readonly) NSArray *list;

// Qualitative
@property (nonatomic, readonly) NSInteger cloudCover;
@property (nonatomic, readonly) NSInteger humidity;
@property (nonatomic, readonly) NSInteger pressure;
@property (nonatomic, readonly) NSInteger rain3hours;
@property (nonatomic, readonly) NSInteger snow3hours;
@property (nonatomic, readonly) double tempCurrent;
@property (nonatomic, readonly) double tempMin;
@property (nonatomic, readonly) double tempMax;
@property (nonatomic, readonly) NSInteger windDirection;
@property (nonatomic, readonly) double windSpeed;

// Methods

-(void)parseWeatherServiceResponse;
-(void)parseWeatherServiceResponseForecast;
@property NSDictionary *weatherServiceResponse;
@property NSDictionary *fiveDaysWeatherServiceResponse;
@property NSDictionary *weatherDic;
@property NSMutableArray *weatherData;
@end
