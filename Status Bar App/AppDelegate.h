//
//  AppDelegate.h
//  Status Bar App
//
//  Created by Kiera Cawley on 8/6/14.
//  Copyright (c) 2014 Kiera Cawley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    NSString *text;

}


@property (strong) IBOutlet NSMenu *menu;
@property (strong, nonatomic) NSStatusItem *statusBar;
-(IBAction)refresh:(id)sender;
@property (strong, nonatomic) NSMutableArray *data;
- (IBAction)notifacations:(id)sender;
@property (weak) IBOutlet NSButton *button;
@property (unsafe_unretained) IBOutlet NSTextView *label;

 

@end
