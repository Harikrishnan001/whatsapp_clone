import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: 70.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WrittenStatusButton(),
          GestureDetector(
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
        ],
      ),
    );
    // return Stack(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(bottom: 80.0, left: 20.0, right: 20.0),
    //       child: WrittenStatusButton(),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(left: 10.0, top: 55.0),
    //       child: GestureDetector(
    //         onTap: () {
    //           print("Camera tapped");
    //         },
    //         child: Container(
    //           height: 60.0,
    //           width: 60.0,
    //           decoration: BoxDecoration(
    //             color: Colors.green,
    //             shape: BoxShape.circle,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey,
    //                 offset: Offset(0, 3),
    //                 blurRadius: 5.0,
    //               )
    //             ],
    //           ),
    //           child: Icon(
    //             Icons.camera_alt_rounded,
    //             size: 22.0,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

class WrittenStatusButton extends StatelessWidget {
  const WrittenStatusButton({
    Key? key,
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
      child: IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.blueGrey,
          size: 25.0,
        ),
        onPressed: () {
          print("Add story!");
          //TODO:add story
        },
      ),
    );
  }
}
