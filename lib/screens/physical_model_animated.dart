import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/decoration_transition.dart';

class PhysicalModelAnimated extends StatefulWidget {
  const PhysicalModelAnimated({Key? key}) : super(key: key);
  static const routeName = '/physical-model';

  @override
  State<PhysicalModelAnimated> createState() => _PhysicalModelAnimatedState();
}

class _PhysicalModelAnimatedState extends State<PhysicalModelAnimated> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhysicalModel Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 10.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(20)),
              child: Container(
                height: 220.0,
                width: 220.0,
                color: Colors.blue[50],
                child: Image.asset('assets/images/flutter.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Click Me!'),
            onPressed: () {
              setState(() {
                _first = !_first;
              });
            },
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, DecorationTransition.routeName),
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
