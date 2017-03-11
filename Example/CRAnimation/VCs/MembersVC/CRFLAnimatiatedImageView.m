//
//  CRFLAnimatiatedImageView.m
//  CRAnimation
//
//  Created by Bear on 17/2/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRFLAnimatiatedImageView.h"
#import "UIImageView+WebCache.h"

@implementation CRFLAnimatiatedImageView

- (void)setGifImageWithURLStr:(NSString *)urlStr
{
    __weak typeof(self) weakSelf = self;
    
    //  clean
    [weakSelf setGifImageWithGifImageData:nil];
    
    NSData *gifImageData = [self imageDataFromDiskCacheWithKey:urlStr];
    
    if (gifImageData) {
        [self setGifImageWithGifImageData:gifImageData];
    } else {
        
        NSURL *url = [NSURL URLWithString:urlStr];
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url
                                                              options:0
                                                             progress:nil
            completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                
                [[[SDWebImageManager sharedManager] imageCache] storeImage:image
                                                                 imageData:data
                                                                    forKey:url.absoluteString
                                                                    toDisk:YES
                                                                completion:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf setGifImageWithGifImageData:data];
                });
            }];
    }
}

- (void)setGifImageWithGifImageData:(NSData *)gifImageData
{
    FLAnimatedImage *gifImage = [FLAnimatedImage animatedImageWithGIFData:gifImageData];
    self.animatedImage = gifImage;
}

- (NSData *)imageDataFromDiskCacheWithKey:(NSString *)key {
    
    NSString *path = [[[SDWebImageManager sharedManager] imageCache] defaultCachePathForKey:key];
    return [NSData dataWithContentsOfFile:path];
}

@end
