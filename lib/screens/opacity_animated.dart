import 'package:flutter/material.dart';
import '../screens/physical_model_animated.dart';

class OpacityAnimated extends StatefulWidget {
  const OpacityAnimated({Key? key}) : super(key: key);
  static const routeName = '/opacity';

  @override
  State<OpacityAnimated> createState() => _OpacityAnimatedState();
}

class _OpacityAnimatedState extends State<OpacityAnimated> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 3),
            child: Image.asset('assets/images/flutter.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _changeOpacity,
            child: const Text('Fade Logo'),
          ),
          const Spacer(),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, PhysicalModelAnimated.routeName),
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
