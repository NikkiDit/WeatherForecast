//
//  WeatherCell.h
//  WeatherForecast
//
//  Created by Adenike Olatunji on 09/01/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *reportTime;
@property (weak, nonatomic) IBOutlet UILabel *tempday;
@property (weak, nonatomic) IBOutlet UILabel *tempMax;
@property (weak, nonatomic) IBOutlet UILabel *tempMin;

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *condition;

@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *cloud;

@property (weak, nonatomic) IBOutlet UILabel *speed;

@property (weak, nonatomic) IBOutlet UILabel *city;


@end
