//
//  QRCodeViewController.m
//  QRCodeEncoderObjectiveCAtGithub
//
//  Created by Bill Shirley on 4/23/13.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//


#import "QRCodeViewController.h"

@interface QRCodeViewController ()
@property (nonatomic, retain) UIView *qrCodeView;
@end

@implementation QRCodeViewController

- (void)_init {
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (id)init {
    self = [super initWithNibName:nil bundle:nil];
    [self _init];
    return self;
}

- (void)awakeFromNib {
    [self _init];
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectNull];
    view.backgroundColor = [UIColor lightGrayColor];
    self.view = view;
    [view release];
}

- (void)setQrCodeImage:(UIImage *)qrCodeImage {
    if (_qrCodeImage == qrCodeImage)
        return;
    
    if (qrCodeImage != nil) {
        [_qrCodeImage release];
        _qrCodeImage = [qrCodeImage retain];
        [_qrCodeView removeFromSuperview];
        
        UIView *newView = [[UIImageView alloc] initWithImage:qrCodeImage];
        newView.autoresizingMask =
        UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin;
        
        self.qrCodeView = newView;
        [self.view addSubview:_qrCodeView];
        _qrCodeView.center = self.view.center;
    } else {
        self.qrCodeImage = nil;
        self.qrCodeView = nil;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    self.view.frame = self.view.superview.bounds;
    self.qrCodeView.center = self.view.center;
}


@end
