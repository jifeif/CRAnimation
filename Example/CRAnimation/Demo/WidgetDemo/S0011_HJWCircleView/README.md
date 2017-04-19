# S0011_HJWCircleView
<img src="http://omk22jt2z.bkt.clouddn.com/S0011_HJWCircleView.gif" width=200 />

## 简介：
HJWCircleView 是一个类似iOS系统软件GameCenter中圆球的浮动效果的视图

| demo信息    | 详情                                                      |
|:-----------:|:---------------------------------------------------------:|
| DemoName    | HJWCircleView                                     |
| CRID        | S00011                                                    |
| author      | [Lemon](https://github.com/SmallLion)                       |
| authorMail  | 573986558@qq.com                                         |
| 源gitHub    | [https://github.com/SmallLion](https://github.com/SmallLion)   |
| 其他说明     | [https://github.com/SmallLion](https://github.com/SmallLion)   |

## 使用：

### Pod
>pod ‘CRAnimation/Widget/HJWCircleView’

### Usage:
```
HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(80, self.view.centerY / 2 + 80, 35, 35)];
circle.color = [UIColor colorWithHexString:@"57d0c9" alpha:1.f] ;
[circle addAniamtionLikeGameCenterBubble];
[self.view addSubview:circle];

```

### Class method
```
/**
*  Cicle Color.
*/
@property (nonatomic, strong) UIColor * color;
/**
*  add Aniamtion, LikeGameCenterBubble.
*/
- (void)addAniamtionLikeGameCenterBubble;
/**
*  Remove Aniamtion, LikeGameCenterBubble.
*/
- (void)RemoveAniamtionLikeGameCenterBubble;

```
