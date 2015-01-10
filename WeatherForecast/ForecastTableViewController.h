//
//  ForecastTableViewController.h
//  WeatherForecast
//
//  Created by Adenike Olatunji on 06/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface  ForecastTableViewController  : UITableViewController

-(void) loadWeatherData: (NSString *)query;
@end
