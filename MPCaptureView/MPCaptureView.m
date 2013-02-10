//
//  MPCaptureView.m
//  MPCaptureView
//
//  Created by Matthias Plappert on 2/9/13.
//  Copyright (c) 2013 Matthias Plappert. All rights reserved.
//

#import "MPCaptureView.h"


@interface MPCaptureView ()

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, assign, readwrite) BOOL capturing;

- (void)_BLCaptureView_commonInit;

@end


@implementation MPCaptureView

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    [self _BLCaptureView_commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    
    [self _BLCaptureView_commonInit];
    
    return self;
}

- (void)_BLCaptureView_commonInit;
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
