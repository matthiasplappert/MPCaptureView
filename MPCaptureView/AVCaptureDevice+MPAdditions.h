//
//  AVCaptureDevice+MPAdditions.h
//  MPCaptureView
//
//  Created by Matthias Plappert on 2/9/13.
//  Copyright (c) 2013 Matthias Plappert. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>


@interface AVCaptureDevice (MPAdditions)

/**
 Returns the front facing camera.
 
 If there are multiple front facing cameras, the first one is returned. If there are no front
 facing cameras, this method returns nil.
 
 @return The front facing camera.
 */
+ (instancetype)frontFacingCamera;

/**
 Returns the back facing camera.
 
 If there are multiple back facing cameras, the first one is returned. If there are no back
 facing cameras, this method returns nil.
 
 @return The back facing camera.
 */
+ (instancetype)backFacingCamera;

@end
