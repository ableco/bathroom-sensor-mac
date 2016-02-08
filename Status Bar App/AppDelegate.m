//
//  AppDelegate.m
//  Status Bar App
//
//  Created by Kiera Cawley on 8/6/14.
//  Copyright (c) 2014 Kiera Cawley. All rights reserved.
//

#import "AppDelegate.h"

#define kAPI_URL @"https://data.sparkfun.com/output/JxxL7ZLvaMSNMJyOxLYW.json?limit=1"
#define kRefreshRateInSeconds 15

@interface AppDelegate () {
    NSURLConnection* _connection;
    BOOL _connectionStarted;
    NSTimer* _timer;
}
@end
    
@implementation AppDelegate

- (void)awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusBar.title = @"Loading....";
    self.statusBar.menu = self.menu;
    
    // initialize timer
    _timer = [NSTimer scheduledTimerWithTimeInterval:kRefreshRateInSeconds target: self selector: @selector(refresh:) userInfo:nil repeats:YES];
    [_timer fire];
}

- (IBAction)refresh:(id)sender {
    if (!_connectionStarted) {
        _connectionStarted = YES;
        NSURL *url = [NSURL URLWithString:kAPI_URL];
        NSURLRequest* urlRequest = [[NSURLRequest alloc] initWithURL:url];
        _connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            if (!error) {
                NSMutableArray* response =  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                NSString* status = response[0][@"status"];

                NSString* imageName = [status isEqualToString:@"Vacant"] ? @"icon-black" : @"icon-blue";
                self.statusBar.image = [NSImage imageNamed:imageName];
                self.statusBar.title = status;
                _connectionStarted = NO;
            } else {
                _connectionStarted = NO;
                NSLog(@"error = %@", error);
            }
        }];
    }
}

@end
