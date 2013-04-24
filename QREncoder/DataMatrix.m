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

#import "DataMatrix.h"

@implementation DataMatrix {
    NSInteger dim;
    bool** data;
}

- (id)initWith:(NSInteger)dimension {
    if ([super init]) {
        dim = dimension;
        data = (bool**)malloc(sizeof(bool*) * dim);
        for (int y=0; y < dim; y++) {
            data[y] = (bool*)malloc(sizeof(bool) * dim);
            if (data[y]==NULL) {
                NSLog(@"null!");
            }
        }
        
    }
    return self;
}

- (NSInteger)roundSizeUp:(NSInteger)imageSize {
    if (imageSize % dim == 0)
        return imageSize;
    
    NSInteger multiple = imageSize / dim;
    multiple += 1;
    NSInteger value = multiple * dim;
    return value;
}

- (NSInteger)roundSizeDown:(NSInteger)imageSize {
    if (imageSize % dim == 0)
        return imageSize;
    
    NSInteger multiple = imageSize / dim;
    NSInteger value = multiple * dim;
    return value;
}

- (NSInteger)dimension {
    return dim;
}

- (void)setBoolValue:(BOOL)value
                   x:(NSInteger)x
                   y:(NSInteger)y {
    data[y][x] = value;
}

- (BOOL)boolValueAt:(NSInteger)x
                  y:(NSInteger)y {
    return data[y][x];
}

- (NSString*)description {
    NSMutableString *value = [[NSMutableString alloc] initWithCapacity:(dim+1) * 2 + 1];

    for (int y=0; y < dim; y++) {
        for (int x=0; x < dim; x++) {
            bool b = data[y][x];
            [value appendFormat:@"%01d", (b) ? 1 : 0];
        }
        [value appendFormat:@"\n"];
    }
    
    return value;
}

- (void)dealloc {
    for (int y=0; y<self->dim; y++) {
        free(data[y]);
    }
    free(data);
    [super dealloc];
}

@end
