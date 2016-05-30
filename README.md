# AnimationTransitions

CAAnimation的子类，用于做转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。iOS比Mac OS X的转场动画效果少一点

UINavigationController就是通过CATransition实现了将控制器的视图推入屏幕的动画效果

属性解析:

type：动画过渡类型

subtype：动画过渡方向

startProgress：动画起点(在整体动画的百分比)

endProgress：动画终点(在整体动画的百分比)

1.2、CAAnimation是什么呢？

CAAnimation可分为四种：

1、CABasicAnimation（基本动画）

通过设定起始点，终点，时间，动画会沿着你这设定点进行移动。可以看做特殊的CAKeyFrameAnimation

2、CAKeyframeAnimation（帧动画）

Keyframe顾名思义就是关键点的frame，你可以通过设定CALayer的始点、中间关键点、终点的frame，时间，动画会沿你设定的轨迹进行移动

3、CAAnimationGroup（动画组）

Group也就是组合的意思，就是把对这个Layer的所有动画都组合起来。PS：一个layer设定了很多动画，他们都会同时执行，如何按顺序执行我到时候再讲。

4、CATransition（转场动画）

这个就是苹果帮开发者封装好的一些动画
