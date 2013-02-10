//
//  MPCaptureView.h
//  MPCaptureView
//
//  Created by Matthias Plappert on 2/9/13.
//  Copyright (c) 2013 Matthias Plappert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


/**
 An instance of MPCaptureView is a means for displaying input from an AVCaptureDevice.
 */
@interface MPCaptureView : UIView

/**
 The capture device.
 */
@property (nonatomic, strong) AVCaptureDevice *captureDevice;

/**
 Indicates if the capture view is currently capturing.
 */
@property (nonatomic, assign, readonly, getter=isCapturing) BOOL capturing;

/**
 Starts capturing.
 
 If the view is already capturing, this method does nothing. You must provide a valid captureDevice
 before calling this method.
 */
- (void)startCapturing;

/**
 Stops capturing.
 
 If the view isn't capturing, this method does nothing.
 */
- (void)stopCapturing;

@end
