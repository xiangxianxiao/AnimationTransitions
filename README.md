# AnimationTransitions

CAAnimation的子类，用于做转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。iOS比Mac OS X的转场动画效果少一点

UINavigationController就是通过CATransition实现了将控制器的视图推入屏幕的动画效果

属性解析:

type：动画过渡类型

subtype：动画过渡方向

startProgress：动画起点(在整体动画的百分比)

endProgress：动画终点(在整体动画的百分比)

