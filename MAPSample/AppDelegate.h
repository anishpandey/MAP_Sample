//
//  AppDelegate.h
//  MAPSample
//
//  Created by Anish Kumar on 3/26/19.
//  Copyright © 2019 Akamai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VocSdk/VocSdk.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id<AkaWebAccelerator> akaService;


@end

