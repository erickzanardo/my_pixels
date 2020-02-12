import 'package:flutter/widgets.dart';
import 'dart:math';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController controller;
  double percent = 0.0;

  bool _selected = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_animation = Tween(begin: 0.0, end: 1.0).animate(controller)
    _animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc)
        ..addListener(() {
          setState(() {
            percent = _animation.value;
          });
        });

    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF0000FF))
        ),
        child: GestureDetector(
            onTap: () {
              if (!_selected) {
                controller.forward();
              } else {
                controller.reverse();
              }
              setState(() {
                _selected = !_selected;
              });
            },
            child: CustomPaint(
                 painter: _LikeButtonPainter(percent),
            )
        )
    );
  }
}

class _LikeButtonPainter extends CustomPainter {

  final _paint = Paint()..color = Color(0xFF0000FF);
  final _paint2 = Paint()..color = Color(0xAA0000FF);
  final _paint3 = Paint()..color = Color(0x550000FF);
  double percent;

  _LikeButtonPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final granularity = 10;

    final cellWidth = size.width / granularity;
    final cellHeight = size.height / granularity;

    final width = max(0, (size.width * percent));
    if (percent < 1) {
      canvas.drawRect(
          Rect.fromLTWH(
              0,
              0,
              width,
              size.height
          ),
          _paint
      );

      var y = 0.0;
      final column = (size.width * percent / cellWidth).floor();
      var row = 0;

      while(y < size.height) {
        if (column % 2 == 0) {
          if (row % 2 == 0) {
            if (width + cellWidth < size.width)
              canvas.drawRect(Rect.fromLTWH(width, y, cellWidth, cellHeight), _paint2);
          } else {
            if (width + cellWidth * 2 < size.width)
              canvas.drawRect(Rect.fromLTWH(width + cellWidth, y, cellWidth, cellHeight), _paint3);
          }
        } else {
          if (row % 2 != 0) {
            if (width + cellWidth < size.width)
              canvas.drawRect(Rect.fromLTWH(width, y, cellWidth, cellHeight), _paint2);
          } else {
            if (width + cellWidth * 2 < size.width)
              canvas.drawRect(Rect.fromLTWH(width + cellWidth, y, cellWidth, cellHeight), _paint3);
          }
        }

        y += cellHeight;
        row++;
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
