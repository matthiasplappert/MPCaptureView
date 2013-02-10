//
//  MPAppDelegate.m
//  MPCaptureViewExample
//
//  Created by Matthias Plappert on 2/10/13.
//  Copyright (c) 2013 Matthias Plappert. All rights reserved.
//

#import "MPAppDelegate.h"

#import "MPCaptureView.h"
#import "AVCaptureDevice+MPAdditions.h"


@interface MPAppDelegate ()

@property (nonatomic, strong) MPCaptureView *captureView;

@end


@implementation MPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.captureView = [[MPCaptureView alloc] initWithFrame:self.window.bounds];
    self.captureView.captureDevice = [AVCaptureDevice backFacingCamera] ?: [AVCaptureDevice frontFacingCamera];
    if (!self.captureView.captureDevice) {
        NSLog(@"No capture device found. Run this on a device with a front or back facing camera. The iPhone Simulator is not supported.");
    }
    [self.window addSubview:self.captureView];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application;
{
    if (self.captureView.captureDevice) {
        [self.captureView startCapturing];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application;
{
    [self.captureView stopCapturing];
}

@end
