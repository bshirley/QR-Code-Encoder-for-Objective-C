//
//  AppDelegate.m
//  QRCodeEncoderDemo
//
//  Created by Yang Ming-Hsien on 4/21/12.
//  Modified by Bill Shirley 4/22/13
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

#import "AppDelegate.h"

#import "DataMatrix.h"
#import "QREncoder.h"
#import "QRCodeViewController.h"

static NSString* aVeryLongURL = @"http://thelongestlistofthelongeststuffatthelongestdomainnameatlonglast.com/";


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (UIImage *)sampleQRCodeImage:(NSString *)textToEncode {
    NSInteger width = 250; // size of QR square
    
    // encode the string into a matrix of booleans,
    // TRUE for black dot and FALSE for white.
    // Let the encoder decide the error correction level and version
    DataMatrix* qrMatrix = [QREncoder encodeWithECLevel:QREncodeLevelAUTO
                                                version:QREncodeVersionAUTO
                                                 string:textToEncode];
    
    width = [qrMatrix roundSizeUp:width];
    
    // render the matrix
    UIImage* qrcodeImage = [QREncoder renderDataMatrix:qrMatrix
                                        imageDimension:width];
    return qrcodeImage;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    /* Use simple code view controller at launch of app:
     * create controller,
     * create example image,
     * set the image in the controller,
     * display the controller.
     */
    QRCodeViewController *qrc = [[QRCodeViewController alloc] init];
    qrc.qrCodeImage = [self sampleQRCodeImage:aVeryLongURL];
    self.viewController = qrc;
    [qrc release];
    
    self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];
    
    [self setupComplexInterface:qrc.view];
    return YES;
}


- (void)setupComplexInterface:(UIView *)view {
    /*
     * Tapping the app will cause a new view hierarchy to be created.
     * We will place a ViewControllers within a Navigation View Controller.
     */
    UIGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(makeComplexInterface:)];
    [view addGestureRecognizer:gr];
}

- (void)makeComplexInterface:(UITapGestureRecognizer *)tgr {
    CGPoint point = [tgr locationInView:self.viewController.view];
    
    if (point.y < 150) {
        NSString *random = [NSString stringWithFormat:@"The Date/Time is %@", [NSDate date]];
        UIImage *image = [self sampleQRCodeImage:random];
        self.viewController.qrCodeImage = image;
        return;
    }
    
    QRCodeViewController *qvc = [[QRCodeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:qvc];
    
    qvc.qrCodeImage = [self sampleQRCodeImage:aVeryLongURL];
    [qvc release];
    self.window.rootViewController = nav;
}

@end
