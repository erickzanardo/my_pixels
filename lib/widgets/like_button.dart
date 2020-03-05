import 'package:flutter/widgets.dart';
import 'dart:math';

import '../common/colors.dart';

class LikeButton extends StatefulWidget {
  final bool selected;
  final double width;
  final double height;
  final void Function(bool) onChange;

  LikeButton({
    this.selected = false,
    this.width = 20,
    this.height = 20,
    this.onChange,
  });

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController controller;
  double percent = 0.0;

  bool _selected;

  @override
  void initState() {
    super.initState();

    _selected = widget.selected;
    if (_selected) {
      percent = 1.0;
    }

    controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this)
          ..value = percent;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!_selected) {
      controller.forward();
    } else {
      controller.reverse();
    }

    if (widget.onChange != null) {
      widget.onChange(!_selected);
    }

    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {
          percent = _animation.value;
        });
      });

    return Container(
        width: widget.width,
        height: widget.height,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.likeButtonColor)),
        child: GestureDetector(
            onTap: () {
              _handleTap();
            },
            child: CustomPaint(
              painter: _LikeButtonPainter(percent),
            )));
  }
}

class _LikeButtonPainter extends CustomPainter {
  final _paint = Paint()..color = Colors.likeButtonColor;
  final _paint2 = Paint()..color = Colors.likeButtonColorOpacity1;
  final _paint3 = Paint()..color = Colors.likeButtonColorOpacity2;
  double percent;

  _LikeButtonPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final granularity = 10;

    final cellWidth = size.width / granularity;

    if (percent < 1) {
      final width = max(0.0, (size.width * percent));

      final columnCount = (width / 10).floor();
      for (var i = 0; i < columnCount; i++) {
        final p = columnCount - i;

        canvas.drawRect(
            Rect.fromLTWH(i * cellWidth, 0, cellWidth + 1, size.height),
            p == 1 ? _paint3 : p == 2 ? _paint2 : _paint);
      }
    } else {
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), _paint);
    }
  }

  @override
  bool shouldRepaint(_LikeButtonPainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
