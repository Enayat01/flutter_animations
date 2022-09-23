import 'package:flutter/material.dart';
import '../screens/align_animation.dart';

class SizeAnimation extends StatefulWidget {
  const SizeAnimation({Key? key}) : super(key: key);
  static const routeName = '/size-animation';

  @override
  State<SizeAnimation> createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation> {
  double _size = 100;
  double _fontSize = 15;
  var _large = false;
  double? _animateSize() {
    setState(() {
      _size = _large ? 300 : 50;
      _fontSize = _large ? 30 : 12;
      _large = !_large;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'homeToSize',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Size'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () => _animateSize(),
                child: Container(
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      AnimatedSize(
                        duration: const Duration(seconds: 1),
                        child: FlutterLogo(
                          size: (_size),
                          curve: Curves.bounceOut,
                        ),
                      ),
                      Text(
                        'Animated Size',
                        style: TextStyle(fontSize: _fontSize),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AlignAnimation.routeName),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
