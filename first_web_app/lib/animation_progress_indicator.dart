import 'package:flutter/material.dart';

class AnimationProgressIndicator extends StatefulWidget {
  final double? value;

  const AnimationProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  _AnimationProgressIndicatorState createState() =>
      _AnimationProgressIndicatorState();
}

class _AnimationProgressIndicatorState extends State<AnimationProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    final colorTween = TweenSequence(
      [
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.red, end: Colors.orange),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.yellow, end: Colors.green),
          weight: 1,
        ),
      ],
    );
    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value!);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }
}
