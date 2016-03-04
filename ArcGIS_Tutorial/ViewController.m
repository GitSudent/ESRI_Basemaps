//
//  ViewController.m
//  ArcGIS_Tutorial
//
//  Created by Charles Grier on 3/4/16.
//  Copyright © 2016 Grier Mobile Development. All rights reserved.
//

#import "ViewController.h"

// add delegate protocol so map can respond to/handle interactions (delegation pattern)
@interface ViewController () <AGSMapViewLayerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Add a basemap tiled layer by accessing ArcGIS online services
    NSURL *url = [NSURL URLWithString:@"https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer"];
    AGSTiledMapServiceLayer *tiledLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:url];
    [self.mapView addMapLayer:tiledLayer withName:@"Basemap Tiled Layer"];
    
    // make sure to set mapview's layer delegate
    self.mapView.layerDelegate = self;
    
}

// example method of implementing the mapView layer delegate

-(void)mapViewDidLoad:(AGSMapView *)mapView {
    // show current location - make sure to put NSLocationWhenInUseUsageDescription in info.plist
    [mapView.locationDisplay startDataSource];
}
- (IBAction)baseMapChanged:(id)sender {
    
    // instantiate URL objects for the type of map service
    // use switch
    NSURL *basemapURL;
    UISegmentedControl *segControl = (UISegmentedControl *)sender;
    switch (segControl.selectedSegmentIndex) {
        case 0: // gray
            basemapURL = [NSURL URLWithString:@"https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer"];
            break;
            
        case 1: // oceans
            basemapURL = [NSURL URLWithString:@"https://services.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer"];
            break;
        
        case 2: //nat geo
            basemapURL = [NSURL URLWithString:@"https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer"]; break;
        
        case 3: // topo
            basemapURL = [NSURL URLWithString:@"https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"];
            break;
            
        case 4: // sat
            basemapURL = [NSURL URLWithString:@"https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer"];
            break;
        
        default:
            break;
    }
    
    // remove basemap
    [self.mapView removeMapLayerWithName:@"Basemap Tiled Layer"];
    
    // add layer from above
    AGSTiledMapServiceLayer *newBaseMapLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:basemapURL];
    [self.mapView insertMapLayer:newBaseMapLayer withName:@"Basemap Tiled Layer" atIndex:0];
    
}
@end
