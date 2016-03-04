//
//  ViewController.h
//  ArcGIS_Tutorial
//
//  Created by Charles Grier on 3/4/16.
//  Copyright © 2016 Grier Mobile Development. All rights reserved.
//

#import <UIKit/UIKit.h>

// make sure to import header file for ArcGIS
#import "ArcGIS/ArcGIS.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet AGSMapView *mapView;

- (IBAction)baseMapChanged:(id)sender;

@end

