// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CircularProgressIndicatorWidget extends StatelessWidget {
  final Widget child;
  final bool visible;
  const CircularProgressIndicatorWidget(
      {Key? key, required this.child, this.visible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        child,  
        Visibility(
          visible: visible,
          child: Container(
            height: screenSize.height,
            width: screenSize.width,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenSize.width * 0.25,
                  width: screenSize.width * 0.25, 
                  decoration: BoxDecoration(
                    //  color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      radius: 20,
                      color: Colors.amberAccent,
                    ),
                  ),
                   ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
