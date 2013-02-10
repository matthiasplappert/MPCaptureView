//
//  MPAppDelegate.m
//  MPCaptureViewExample
//
//  Copyright (c) 2013 Matthias Plappert <matthiasplappert@me.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
