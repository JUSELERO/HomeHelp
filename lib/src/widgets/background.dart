import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  Widget child;
  Background({ this.child });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: size.width * 0.3
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_bottom.png',
              width: size.width * 0.3
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.04),
            height: double.infinity,
            width: double.infinity,
            child: this.child,
          ),
        ]
      ),
    );
  }
}