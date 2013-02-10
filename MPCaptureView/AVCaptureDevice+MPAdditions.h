//
//  AVCaptureDevice+MPAdditions.h
//  MPCaptureView
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
