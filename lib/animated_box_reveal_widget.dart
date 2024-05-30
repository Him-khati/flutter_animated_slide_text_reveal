import 'package:flutter/material.dart';

class AnimatedBoxRevealAnimationWidget extends AnimatedWidget {
  final AnimationController animationController;
  final bool isVerticalReveal;
  final double height;
  final double width;
  final Color boxColor;
  final Color surfaceColor;
  final bool dismissBoxPostReveal;

  const AnimatedBoxRevealAnimationWidget({
    super.key,
    required this.animationController,
    required this.height,
    required this.width,
    required this.boxColor,
    required this.surfaceColor,
    this.isVerticalReveal = false,
    this.dismissBoxPostReveal = true,
  }) : super(
          listenable: animationController,
        );

  Animation<double> get boxRevealAnimation =>
      Tween<double>(begin: 0.0, end: isVerticalReveal ? height : width)
          .animate(CurvedAnimation(
              parent: animationController,
              curve: const Interval(
                0,
                0.5,
                curve: Curves.fastOutSlowIn,
              )));

  Animation<double> get boxdismissAnimation =>
      Tween<double>(begin: 0.0, end: isVerticalReveal ? height : width)
          .animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: isVerticalReveal ? width : boxRevealAnimation.value,
              height: isVerticalReveal ? boxRevealAnimation.value : height,
              color: boxColor,
            ),
          ),
          Container(
            width: isVerticalReveal ? width : boxdismissAnimation.value,
            height: isVerticalReveal ? boxdismissAnimation.value : height,
            color: surfaceColor,
          )
        ],
      ),
    );
  }
}
