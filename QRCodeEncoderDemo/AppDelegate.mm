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

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (UIImage *)sampleQRCodeImage {
    int qrcodeImageDimension = 250; // size of square
    
    //the string can be very long
    NSString* aVeryLongURL = @"http://thelongestlistofthelongeststuffatthelongestdomainnameatlonglast.com/";
    
    // encode the string into a matrix of bools,
    // TRUE for black dot and FALSE for white.
    // Let the encoder decide the error correction level and version
    DataMatrix* qrMatrix = [QREncoder encodeWithECLevel:QREncodeLevelAUTO
                                                version:QREncodeVersionAUTO
                                                 string:aVeryLongURL];
    
    // render the matrix
    UIImage* qrcodeImage = [QREncoder renderDataMatrix:qrMatrix
                                        imageDimension:qrcodeImageDimension];
    return qrcodeImage;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    QRCodeEncoderDemoViewController *qrc = [[QRCodeEncoderDemoViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    qrc.qrCodeImage = [self sampleQRCodeImage];
    self.viewController = qrc;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    [qrc release];
    
    return YES;
}

@end
