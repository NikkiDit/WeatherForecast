//
//  WeatherForecastData.h
//  WeatherForecast
//
//  Created by Adenike Olatunji on 07/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherForecastData : NSObject
+(NSArray *) WeatherDataFromJSON:(NSData *)weatherInfo;

@end
