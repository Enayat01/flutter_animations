import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/rotate_transition.dart';

class DecorationTransition extends StatefulWidget {
  const DecorationTransition({Key? key}) : super(key: key);
  static const routeName = '/decoration-transition';

  @override
  State<DecorationTransition> createState() => _DecorationTransitionState();
}

class _DecorationTransitionState extends State<DecorationTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _clicked = true;

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black),
    ),
    end: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black),
      boxShadow: const [
        (BoxShadow(
          color: Colors.red,
          spreadRadius: 8,
          blurRadius: 5,
          offset: Offset(10, 10),
        )),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decoration box Transition'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (_clicked) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              _clicked = !_clicked;
            },
            child: Center(
              child: DecoratedBoxTransition(
                decoration: decorationTween.animate(_controller),
                position: DecorationPosition.background,
                child: const SizedBox(
                  width: 200,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Animate into 3d box',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, RotateTransition.routeName),
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
