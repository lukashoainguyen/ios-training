//
//  Artist.h
//  Objective-C
//
//  Created by DXC-Technology on 10/25/17.
//

#import <Foundation/Foundation.h>

@class Album;

@interface Artist : NSObject

- (void)orderAlbum:(Album *)album quantity:(NSUInteger)quantity;

@end
