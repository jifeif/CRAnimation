# S0008_JHUD
<img src="http://omk22jt2z.bkt.clouddn.com/S0008_JHUD_20170311.gif" width=200 />

##简介：
JHUD 是一个用于在加载数据时全屏显示的HUD

| demo信息    | 详情                                                      |
|:-----------:|:---------------------------------------------------------:|
| DemoName    | JHUD                                     |
| CRID        | S00008                                                    |
| author      | [晋先森](https://github.com/Jinxiansen)                        |
| authorMail  | 463424863@qq.com                                         |
| 源gitHub    | <a href="https://github.com/Jinxiansen/JHUD" target="_blank">https://github.com/Jinxiansen/JHUD</a>  |
| 其他说明     | <a href="http://www.jianshu.com/p/fc07f027680c" target="_blank">http://www.jianshu.com/p/fc07f027680c</a> |

##使用：

###Pod
>pod ‘JHUD’

###Usage:
```
hudView = [[JHUD alloc]initWithFrame:self.view.bounds];

hudView.messageLabel.text = @"hello ,this is a circle animation";

//show
[hudView showAtView:self.view hudType:JHUDLoadingTypeCircle];

//hide 
[hudView hide];
```

###Class method
```
[JHUD showAtView:self.view message:@"Hello, this is a message"];

[JHUD hide];
```
