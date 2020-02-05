import 'package:flutter/material.dart';

class BlinkAnimation extends StatefulWidget {
  final Color color;
  BlinkAnimation(this.color);

  @override
  _BlinkAnimationState createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends State<BlinkAnimation>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 170), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: widget.color, end: Colors.white).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      setState(() {});
    });
  }

  animateFromNextSequence() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return GestureDetector(
            onTap: () {
              controller.forward();
            },
            child: new Container(
              decoration: BoxDecoration(
                color: animation.value,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
