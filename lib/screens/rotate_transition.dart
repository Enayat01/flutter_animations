import 'package:flutter/material.dart';

class RotateTransition extends StatefulWidget {
  const RotateTransition({Key? key}) : super(key: key);
  static const routeName = '/rotation-transition';

  @override
  State<RotateTransition> createState() => _RotateTransitionState();
}

class _RotateTransitionState extends State<RotateTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Transition'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RotationTransition(
              turns: _animation,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/cube.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Rotational Transition',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
