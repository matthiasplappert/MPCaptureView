//
//  AVCaptureDevice+MPAdditions.m
//  MPCaptureView
//
//  Created by Matthias Plappert on 2/9/13.
//  Copyright (c) 2013 Matthias Plappert. All rights reserved.
//

#import "AVCaptureDevice+MPAdditions.h"


@implementation AVCaptureDevice (MPAdditions)

+ (instancetype)frontFacingCamera;
{
    NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *videoDevice in videoDevices) {
        if (videoDevice.position == AVCaptureDevicePositionFront) {
            return videoDevice;
        }
    }
    
    return nil;
}

+ (instancetype)backFacingCamera;
{
    NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *videoDevice in videoDevices) {
        if (videoDevice.position == AVCaptureDevicePositionBack) {
            return videoDevice;
        }
    }
    
    return nil;
}

@end
