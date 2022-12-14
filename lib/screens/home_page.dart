import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/cross_fade_animation.dart';
import '../screens/size_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 100;
  double _width = 100;

  var _large = false;
  late double screenWidth;

  double? _animateContainer() {
    setState(() {
      _width = _large ? screenWidth : 100;
      _height = _large ? 300 : 100;
      _large = !_large;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'homeToSize',
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(seconds: 4),
              height: _height,
              width: _width,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Animated Container',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => _animateContainer(),
                child: const Text('Animate'),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.pushNamed(
                        context, CrossFadeAnimation.routeName),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text(
                      'New Page',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SizeAnimation.routeName),
                    child: Row(
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
          ],
        ),
      ),
    );
  }
}
