//
//  ViewController.m
//  MAPSample
//
//  Created by Anish Kumar on 3/26/19.
//  Copyright © 2019 Akamai. All rights reserved.
//

#import "ViewController.h"
#import <VocSdk/VocSdk.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(startService:) name:@"SDKInitialized" object:nil ] ;
}

-(void)startService:(NSNotification*)notification
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    [VocServiceFactory setupSessionConfiguration:sessionConfig];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    
    NSURL *urlStr = [NSURL URLWithString:@"https://cdn.rawgit.com/anishpandey/SampleApp/master/largeJSON.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlStr];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = nil;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (jsonArray != nil && [jsonArray isKindOfClass:[NSArray class]]) {
                NSLog(@"JSON = %@", jsonArray);
            }
        });
    }];
    [task resume];
    
}
@end
