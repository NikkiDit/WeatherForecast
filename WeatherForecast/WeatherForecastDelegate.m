//
//  WeatherForecastDelegate.m
//  WeatherForecast
//
//  Created by Adenike Olatunji on 07/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WeatherForecastDelegate
-(void) receivedWeatherJSON:(NSData *) weatherData;
-(void) fetchingWeatherFailedWithError:(NSError *)error;
@end