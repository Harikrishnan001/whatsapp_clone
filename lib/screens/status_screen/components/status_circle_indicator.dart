import 'dart:math' as Math;

import 'package:flutter/material.dart';

class StatusCircleIndicator extends StatelessWidget {
  final int total;
  final int viewed;
  final Color viewedColor;
  final Color unViewedColor;
  final String? imageURL;

  const StatusCircleIndicator({
    Key? key,
    required this.total,
    required this.viewed,
    this.imageURL, //TODO:use image
    this.viewedColor = Colors.grey,
    this.unViewedColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StatusPainter(total: total, viewed: viewed),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 52.0,
        width: 52.0,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        //TODO:child image
      ),
    );
  }
}

class StatusPainter extends CustomPainter {
  final int total;
  final int viewed;
  final Color viewedColor;
  final Color unviewedColor;
  StatusPainter({
    required this.total,
    required this.viewed,
    this.viewedColor = Colors.grey,
    this.unviewedColor = Colors.green,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final anglePadding = 10.0;
    final radiusgap = 7.0;
    final viewedPaint = Paint()
      ..color = viewedColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5;
    final paint = Paint()
      ..color = unviewedColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5;
    double angle = -90.0;
    double step = 360.0 / total;
    int unviewed = total - viewed;
    while (angle < 270.0) {
      if (unviewed > 0) {
        canvas.drawArc(
            Rect.fromCircle(
                center: Offset(size.width / 2, size.height / 2),
                radius: size.width / 2 - radiusgap),
            _degToRad(angle + anglePadding / 2),
            _degToRad(step - anglePadding),
            false,
            paint);
        unviewed--;
      } else {
        canvas.drawArc(
            Rect.fromCircle(
                center: Offset(size.width / 2, size.height / 2),
                radius: size.width / 2 - radiusgap),
            _degToRad(angle + anglePadding / 2),
            _degToRad(step - anglePadding),
            false,
            viewedPaint);
      }
      angle += step;
    }
  }

  @override
  bool shouldRepaint(StatusPainter oldDelegate) {
    return oldDelegate.total != this.total || oldDelegate.viewed != this.viewed;
  }

  double _degToRad(double deg) {
    return Math.pi / 180.0 * deg;
  }
}
