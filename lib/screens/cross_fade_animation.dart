import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/signup_page.dart';

import '../widgets/login_page.dart';

class CrossFadeAnimation extends StatefulWidget {
  const CrossFadeAnimation({Key? key}) : super(key: key);
  static const routeName = '/cf-animation';

  @override
  State<CrossFadeAnimation> createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrossFade Animation'),
      ),
      body: SingleChildScrollView(
        child: AnimatedCrossFade(
          firstCurve: Curves.easeOutBack,
          secondCurve: Curves.easeInBack,
          firstChild: LoginPage(onPressed: () {
            setState(() {
              _first = !_first;
            });
          }),
          secondChild: SignupPage(onPressed: () {
            setState(() {
              _first = !_first;
            });
          }),
          crossFadeState:
              _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
