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


@interface DataMatrix : NSObject 


@property (nonatomic, readonly) NSInteger dimension;

- (id)initWith:(NSInteger)dimension;

/**
 * These methods will round the size to the nearest multiple
 * of the dimentionality of this data matrix.
 */
- (NSInteger)roundSizeUp:(NSInteger)imageSize;
- (NSInteger)roundSizeDown:(NSInteger)imageSize;

- (void)setBoolValue:(BOOL)value x:(NSInteger)x y:(NSInteger)y;
- (BOOL)boolValueAt:(NSInteger)x y:(NSInteger)y;


- (NSString*)description;

@end
