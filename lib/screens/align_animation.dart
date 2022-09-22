import 'package:flutter/material.dart';
import '../screens/positioned_screen.dart';

class AlignAnimation extends StatefulWidget {
  const AlignAnimation({Key? key}) : super(key: key);
  static const routeName= '/align-animation';

  @override
  State<AlignAnimation> createState() => _AlignAnimationState();
}

class _AlignAnimationState extends State<AlignAnimation> {
  var _aligned = false;
  void _animateAlign() {
    setState(() {
      _aligned = !_aligned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Align'),),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => _animateAlign(),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 440.0,
                color: Colors.black54,
                child: AnimatedAlign(
                  alignment: _aligned ? Alignment.topCenter : Alignment.bottomCenter,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(
                      'assets/images/rocket.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, PositionedScreen.routeName),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
