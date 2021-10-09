import 'package:flutter/material.dart';

class MyStatusTile extends StatelessWidget {
  const MyStatusTile({
    Key? key,
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
