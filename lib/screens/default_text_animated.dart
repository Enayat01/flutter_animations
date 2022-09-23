import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/list_animated.dart';

class DefaultTextAnimation extends StatefulWidget {
  const DefaultTextAnimation({Key? key}) : super(key: key);
  static const routeName = '/default-text';

  @override
  State<DefaultTextAnimation> createState() => _DefaultTextAnimationState();
}

class _DefaultTextAnimationState extends State<DefaultTextAnimation> {
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DefaultText Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 120,
              child: AnimatedDefaultTextStyle(
                curve: Curves.easeInBack,
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: const Text('Flutter'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _fontSize = _first ? 100 : 50;
                _color = _first ? Colors.blue : Colors.orange;
                _first = !_first;
              });
            },
            child: const Text(
              "CLICK HERE",
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, ListAnimated.routeName),
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
    );
  }
}
