//
//  PhotoBrowserScrollView.m
//  MyPhotoShow
//
//  Created by NEW on 15/12/14.
//  Copyright © 2015年 CCJ. All rights reserved.
//

#define Screen_Width  ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height  ([UIScreen mainScreen].bounds.size.height)
#import "PhotoBrowserScrollView.h"

#import "UIImageView+WebCache.h"

#import "PhotoScrollView.h"

@interface PhotoBrowserScrollView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,assign) CGPoint memoryPoint;

@end

@implementation PhotoBrowserScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
    
        [self setBackgroundColor:[UIColor darkGrayColor]];
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        self.pagingEnabled = YES;
        self.bounces = NO;
        [self setBouncesZoom:NO];
        
        
    }
    
    return self;
}




-(void)setArrayUrl:(NSArray *)arrayUrl
{

    _arrayUrl = arrayUrl;
    for (UIView *tempView in self.subviews) {
        [tempView removeFromSuperview];
    }
    int i=0;
    for (UIImage *image in arrayUrl) {
      PhotoScrollView*  imageScrollView = [[PhotoScrollView alloc] initWithFrame:CGRectMake(Screen_Width*i, 0, Screen_Width, self.frame.size.height)];
        imageScrollView.delegate = self;
        imageScrollView.maximumZoomScale = 2.f;
        imageScrollView.minimumZoomScale = 0.1f;
        [imageScrollView setBouncesZoom:NO];

        imageScrollView.startScrollView = ^{
            self.scrollEnabled = YES;
        };
        imageScrollView.stopScrollView = ^{
            self.scrollEnabled = NO;
        };
        [self addSubview:imageScrollView];
        imageScrollView.backgroundColor = [UIColor darkGrayColor];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = image ;
        
        imageScrollView.contentSize = CGSizeMake(Screen_Width, Screen_Width);
        
        imageView.frame = CGRectMake(0, 0, Screen_Width, Screen_Width);
        imageView.contentMode = UIViewContentModeScaleAspectFit;

        imageScrollView.childView = imageView;
        [self setMinimumZoomForCurrentFrameWithScrollView:imageScrollView];
        [imageScrollView setZoomScale:imageScrollView.minimumZoomScale animated:NO];
        [imageScrollView setZoomScale:1 animated:NO];

        i++;
        
        
        imageView.userInteractionEnabled = YES;


        //点击手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
        [imageView addGestureRecognizer:tapGesture];
        tapGesture.numberOfTapsRequired=1;
    }
    
    self.contentSize = CGSizeMake(Screen_Width *_arrayUrl.count, self.frame.size.height);
    
    self.contentOffset = CGPointMake(_currenIndex*Screen_Width, 0);

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
//    PSBJet * jet = (PSBJet *)[self.view viewWithTag:11];

    
    return YES;
}


- (void)setMinimumZoomForCurrentFrameWithScrollView:(PhotoScrollView *)tempSrollView
{
    UIImageView *imageView = (UIImageView *)[tempSrollView childView];
    
    // Work out a nice minimum zoom for the image - if it's smaller than the ScrollView then 1.0x zoom otherwise a scaled down zoom so it fits in the ScrollView entirely when zoomed out
    CGSize imageSize = imageView.image.size;
    CGSize scrollSize = tempSrollView.frame.size;
    CGFloat widthRatio = scrollSize.width / imageSize.width;
    CGFloat heightRatio = scrollSize.height / imageSize.height;
//    CGFloat minimumZoom = MIN(1.0, (widthRatio > heightRatio) ? heightRatio : widthRatio);
    CGFloat minimumZoom = MIN(1.0, (widthRatio > heightRatio) ? heightRatio : widthRatio);

    [tempSrollView setMinimumZoomScale:minimumZoom];
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{

    if(scrollView.zoomScale<1){
        self.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:scrollView.zoomScale/3];
        
        if(_zoomChange){
            _zoomChange(scrollView.zoomScale);
        }

    }else
    {
        if(_zoomChange){
            _zoomChange(scrollView.zoomScale);
        }
        self.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:1];
    }
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale
{
    if(scale<0.01){
        [self.superview removeFromSuperview];
        //[[UIApplication sharedApplication] setStatusBarHidden:false];
 

    }else if(scale <1){
        [UIView animateWithDuration:0.3 animations:^{
            [scrollView setZoomScale:1.0];
            self.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:1];
        }];
    }
    else
    {
        self.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:1];

    }
    
}

- (UIView *)viewForZoomingInScrollView:(PhotoScrollView *)aScrollView {
    return [aScrollView childView];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)imageClick:(UIButton *)button
{
    //[[UIApplication sharedApplication] setStatusBarHidden:false];
    
    if(_imageClickBlock){
        _imageClickBlock();
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
