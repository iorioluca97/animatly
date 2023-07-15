import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _radius = 100;

  final Tween<double> backGroundscale = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            pageBackground(),
            circularAnimationButton(),
          ],
        ),
      ),
    );
  }

  Widget pageBackground() {
    return TweenAnimationBuilder(
        curve: Curves.easeInOutCubicEmphasized,
        tween: backGroundscale,
        duration: Duration(seconds: 1),
        builder: (context, double _scale, _child) {
          return Transform.scale(
            scale: _scale,
            child: _child,
          );
        },
        child: Container(color: Colors.blue));
  }

  Widget circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_radius != 200) {
            setState(() {
              _radius = 200;
            });
          } else {
            setState(() {
              _radius = 100;
            });
          }
        },
        child: AnimatedContainer(
          curve: Curves.bounceInOut,
          duration: const Duration(seconds: 1),
          height: _radius,
          width: _radius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: const Center(
            child: Text(
              "Basic!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
