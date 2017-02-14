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
    
    
    // https://github.com/Flipboard/FLAnimatedImage
    
//    NSString *imagePath                = @"http://images2015.cnblogs.com/blog/607542/201601/607542-20160123090832343-133952004.gif";
    NSData   *gifImageData             = [self imageDataFromDiskCacheWithKey:urlStr];
    
    if (gifImageData) {
        
        [self setGifImageWithGifImageData:gifImageData];
        
    } else {
        
        NSURL *url = [NSURL URLWithString:urlStr];
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url
                                                              options:0
                                                             progress:nil
            completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                
                [[[SDWebImageManager sharedManager] imageCache] storeImage:image
                                                      recalculateFromImage:NO
                                                                 imageData:data
                                                                    forKey:url.absoluteString
                                                                    toDisk:YES];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
