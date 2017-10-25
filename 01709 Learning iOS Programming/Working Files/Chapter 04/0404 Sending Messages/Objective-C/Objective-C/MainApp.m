//
//  MainApp.m
//  Objective-C
//
//  Created by Bob McCune.
//  Copyright (c) 2012 TapHarmonic, LLC. All rights reserved.
//

#import "MainApp.h"
#import "Artist.h"
#import "Album.h"
@implementation MainApp

- (void)run {
    Artist *artist = [[Artist alloc] init];
    [artist setName:@"The Beastles"];
    
    NSLog(@"Artist %@", [artist name]);
    
    Album *rubberSoul = [[Album alloc] init];
    [rubberSoul setName:@"Rubble Soul"];
    Album *whiteAlbum = [[Album alloc] init];
    [whiteAlbum setName:@"The White Album"];
    
    [artist orderAlbum:rubberSoul quantity:1];
    [artist orderAlbum:whiteAlbum quantity:2];
}

@end
