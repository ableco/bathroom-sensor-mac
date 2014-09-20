//
//  AppDelegate.m
//  Status Bar App
//
//  Created by Kiera Cawley on 8/6/14.
//  Copyright (c) 2014 Kiera Cawley. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize statusBar = _statusBar;

- (void)applicationDidFinishLaunching:(NSNotification *)Notification
{
    
}

- (void) awakeFromNib {
    
    
    
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    self.statusBar.title = @"Loading....";
    
    // you can also set an image
    //self.statusBar.image =
    
    self.statusBar.menu = self.menu;
    //self.statusBar.highlightMode = YES;
    
    
    NSTimer *timer;
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.5
                                             target: self
                                           selector: @selector(refresh:)
                                           userInfo: nil
                                            repeats: YES];

}
- (void)statusApplicatinClicked:(id)sender {
    }

-(IBAction)refresh:(id)sender{
    NSString *json = @"https://data.sparkfun.com/output/JxxL7ZLvaMSNMJyOxLYW.json";
    
    
    NSURL *url2 = [NSURL URLWithString: json];
    NSData *JSON =[NSData dataWithContentsOfURL:url2];
    
    self.data =  [NSJSONSerialization JSONObjectWithData:JSON options:kNilOptions error:nil];
    
   
    
    
        text = self.data[0][@"status"];
    

    
    if ([self.statusBar.title isEqualToString:text]) {
        
    }
    else{
        if ([_button.title isEqualToString:@"ON"]) {
            NSUserNotification *notification = [[NSUserNotification alloc] init];
            notification.title = @"The bathroom is";
            notification.informativeText = text;
            notification.soundName = NSUserNotificationDefaultSoundName;
            
            [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
        }
        
    }
    if([text isEqualToString:@"Vacant"]){
        
        self.statusBar.image = [NSImage imageNamed:@"icon-black"];
        
        
    }
    else{
        
        self.statusBar.image = [NSImage imageNamed:@"icon-blue"];

    }
    
    self.statusBar.title = text;


//    if (self.menu.showsStateColumn) {
//        self.statusBar.image =[NSImage imageNamed:@"icon-white"];
//    }
//    else {
//        if([text isEqualToString:@"Vacant"]){
//            
//            self.statusBar.image = [NSImage imageNamed:@"icon-blue"];
//            
//            
//        }
//        else{
//            
//            self.statusBar.image = [NSImage imageNamed:@"icon-black"];
//            
//        }
//
//    }
    
}

- (IBAction)notifacations:(id)sender {
    
    if ([_button.title  isEqualToString: @"OFF"]) {
        
        _button.title = @"ON";
        
    }
    else{
        
        _button.title = @"OFF";
        
    }
    
    
}
@end
