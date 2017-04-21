# S0012_HJWWaterWave
<img src="http://omk22jt2z.bkt.clouddn.com/S0012_HJWWaterWave.gif" width=200 />

## 简介：
HJWWaterWave 是一个用drawRect以及CAReplicatorLayer绘制动态水波纹视图

- DrawRectObject
This is a tool, to help you draw shapes faster.

- ReplicatorLineAnimationView
This is a tool, to help you realize the effects what is repeat moving.


| demo信息    | 详情                                                      |
|:-----------:|:---------------------------------------------------------:|
| DemoName    | HJWWaterWave                                     |
| CRID        | S00012                                                    |
| author      | [Lemon](https://github.com/SmallLion)                       |
| authorMail  | 573986558@qq.com                                         |
| 源gitHub    | [https://github.com/SmallLion](https://github.com/SmallLion)   |
| 其他说明     | [https://github.com/SmallLion](https://github.com/SmallLion)   |

## 使用：

### Pod
>pod ‘CRAnimation/Widget/HJWWaterWave’

### Usage:
```
/**
Use:
1. New A HJWWaveView Class
    · set phase, waveCrest, waveCount, type...
2. New DrawingStyle of fillStyle and DrawingStyle of strokeStyle
    · set fillColor, fillStyle/ storkeColor, storkeStyle...
3. New A ReplicatorLineAnimationView Class,
    · set direction, speed, contentView...
    · startAnimation
*/

{
    HJWWaveView *waveView = [[HJWWaveView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    waveView.phase     = 0.f;
    waveView.waveCrest = 5.f;
    waveView.waveCount = 1;
    waveView.type      = kStrokeWave | kFillWave;

    {
        DrawingStyle *fillStyle = [DrawingStyle new];
        fillStyle.fillColor     = [DrawingColor colorWithUIColor:[[UIColor redColor] colorWithAlphaComponent:0.25f]];
        waveView.fillStyle      = fillStyle;

        DrawingStyle *strokeStyle = [DrawingStyle new];
        strokeStyle.strokeColor   = [DrawingColor colorWithUIColor:[[UIColor redColor] colorWithAlphaComponent:0.5f]];
        strokeStyle.lineWidth     = 0.5f;
        waveView.strokeStyle      = strokeStyle;
    }

    ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
    replicatorLineView.direction   = kReplicatorLeft;
    replicatorLineView.speed       = 0.1f;
    replicatorLineView.contentView = waveView;
    [replicatorLineView startAnimation];
    [self.view addSubview:replicatorLineView];
}


```

### Class method
```
/**
*  Wave type, default is kFillWave.
*/
@property (nonatomic) EWaveViewType type;

/**
*  Sine phase, default is 0.
*/
@property (nonatomic) CGFloat  phase;

/**
*  Wave crest height, Default is 10.
*/
@property (nonatomic) CGFloat  waveCrest;

/**
*  Full wave count,  default is 1.
*/
@property (nonatomic) NSInteger waveCount;

/**
*  The fill style.
*/
@property (nonatomic, strong) DrawingStyle *fillStyle;

/**
*  The stroke style.
*/
@property (nonatomic, strong) DrawingStyle *strokeStyle;

```
