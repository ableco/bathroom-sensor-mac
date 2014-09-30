//
//  AppDelegate.h
//  Status Bar App
//
//  Created by Kiera Cawley on 8/6/14.
//  Copyright (c) 2014 Kiera Cawley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) IBOutlet NSMenu *menu;
@property (unsafe_unretained) IBOutlet NSTextView *label;
@property (weak, nonatomic)   IBOutlet NSButton *button;

@property (strong, nonatomic) NSStatusItem *statusBar;

- (IBAction)refresh:(id)sender;
- (IBAction)notification:(id)sender;

@end
