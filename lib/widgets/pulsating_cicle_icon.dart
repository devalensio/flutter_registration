import 'package:flutter/material.dart';

class PulsatingCircleIcon extends StatefulWidget {
  @override
  _PulsatingCircleIconState createState() => _PulsatingCircleIconState();
}

class _PulsatingCircleIconState extends State<PulsatingCircleIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween(
      begin: 0.0,
      end: 12.0,
    ).animate(_animationController);

    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.stop(canceled: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Ink(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  for (int i = 1; i <= 1; i++)
                    BoxShadow(
                      color: Colors.white.withOpacity(_animation.value / 50),
                      spreadRadius: _animation.value * i,
                    )
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            );
          }),
    );
  }
}
