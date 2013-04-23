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


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DataMatrix;


/**
 * The encoding level defines what level of error correction is
 * employed in making the code. The higher the level the larger
 * the resolution/version of the code.
 *  Low      -  7% correction
 *  Medium   - 15% correction
 *  Quartile - 25% correction
 *  Hight    - 30% correction
 */
typedef enum _QREncodeLevelType {
    QREncodeLevelLow = 0,
    QREncodeLevelMedium = 1,
    QREncodeLevelQuartile = 2,
    QREncodeLevelHigh = 3,
    QREncodeLevelAUTO = QREncodeLevelLow
} QREncodeLevelType;


/**
 * There are 40 versions of QR code depending on the number of squares
 * on a side. The 21x21 to 177x177.  The versions 1-40 indexing into
 * the list that's available.  The versions below are adaptive within
 * that range.  The length of the encoded text for a given size/version
 * will vary depending on the amount of encoding level.
 */
typedef enum _QREncodeVersionType {
    QREncodeVersionSmall = 0,  // version 1-9
    QREncodeVersionMedium = 1, // version 10-26
    QREncodeVersionLarge = 2,  // version 27-40
    QREncodeVersionAUTO = -1
} QREncodeVersionType;


@interface QREncoder : NSObject {
    
}

+ (DataMatrix *)encodeWithECLevel:(QREncodeLevelType)ecLevel
                         version:(QREncodeVersionType)version
                          string:(NSString *)string
                   AESPassphrase:(NSString *)AESPassphrase;

+ (DataMatrix *)encodeWithECLevel:(QREncodeLevelType)ecLevel
                         version:(QREncodeVersionType)version
                          string:(NSString *)string;

+ (UIImage *)renderDataMatrix:(DataMatrix *)matrix
              imageDimension:(NSInteger)imageDimension;

@end

