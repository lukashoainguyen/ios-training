//
//  Album.h
//  Objective-C
//
//  Created by DXC-Technology on 10/25/17.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

- (void)markAsFavorite;
- (NSString *)name;
- (void)setName:(NSString *)name;

@end
