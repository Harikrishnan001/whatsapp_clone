import 'package:flutter/material.dart';
import 'dart:math' as Math;

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MyStatusTile()),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Text(
                'Recent updates',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 80.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 12.0),
                    StatusCircleIndicator(
                      total: 5,
                      viewed: 2,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'John Paul',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '46 minutes ago',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }, childCount: 2),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Text(
                'Viewed updates',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 80.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 12.0),
                    StatusCircleIndicator(
                      total: 5,
                      viewed: 5,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'John Paul',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '46 minutes ago',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }, childCount: 2),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 80.0, left: 20.0, right: 20.0),
            child: WrittenStatusButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 55.0),
            child: GestureDetector(
              onTap: () {
                print("Camera tapped");
              },
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 3),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WrittenStatusButton extends StatelessWidget {
  const WrittenStatusButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 5.0, color: Colors.grey, offset: Offset(0, 3))
        ],
        color: Colors.blueGrey[50],
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.edit,
        color: Colors.blueGrey,
        size: 25.0,
      ),
    );
  }
}

class StatusCircleIndicator extends StatelessWidget {
  final int total;
  final int viewed;
  final Color viewedColor;
  final Color unViewedColor;
  const StatusCircleIndicator({
    Key key,
    @required this.total,
    @required this.viewed,
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
      ),
    );
  }
}

class MyStatusTile extends StatelessWidget {
  const MyStatusTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              //TODO:menu for adding status
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey[400],
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[100],
                    size: 50.0,
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  left: 50.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 22.0,
                    width: 22.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Status',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                'Tap to add status update',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ],
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
    @required this.total,
    @required this.viewed,
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
            degToRad(angle + anglePadding / 2),
            degToRad(step - anglePadding),
            false,
            paint);
        unviewed--;
      } else {
        canvas.drawArc(
            Rect.fromCircle(
                center: Offset(size.width / 2, size.height / 2),
                radius: size.width / 2 - radiusgap),
            degToRad(angle + anglePadding / 2),
            degToRad(step - anglePadding),
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

  double degToRad(double deg) {
    return Math.pi / 180.0 * deg;
  }
}
