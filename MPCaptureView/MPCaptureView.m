//
//  MPCaptureView.m
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

#import "MPCaptureView.h"


@interface MPCaptureView ()

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, assign, readwrite) BOOL capturing;

- (void)_MPCaptureView_commonInit;

@end


@implementation MPCaptureView

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    [self _MPCaptureView_commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    
    [self _MPCaptureView_commonInit];
    
    return self;
}

- (void)_MPCaptureView_commonInit;
{
    _captureSession = [[AVCaptureSession alloc] init];
    
    _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _previewLayer.frame = self.frame;
    [self.layer addSublayer:_previewLayer];
}

- (void)dealloc;
{
    [_captureSession stopRunning];
}

#pragma mark - Actions

- (void)startCapturing;
{
    NSAssert(self.captureDevice, @"Can't start without a capture device.");
    if (self.capturing) {
        return;
    }
    
    NSError *error;
    self.deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.captureDevice error:&error];
    if (!self.deviceInput) {
        NSLog(@"Couldn't add input to capture session: %@", error);
        return;
    }
    
    [self.captureSession addInput:self.deviceInput];
    [self.captureSession startRunning];
    self.capturing = YES;
}

- (void)stopCapturing;
{
    if (!self.capturing) {
        return;
    }
    
    [self.captureSession stopRunning];
    [self.captureSession removeInput:self.deviceInput];
    self.capturing = NO;
}

@end
