import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/hero_image.dart';

class PositionedScreen extends StatefulWidget {
  const PositionedScreen({Key? key}) : super(key: key);
  static const routeName = '/positioned-animation';

  @override
  State<PositionedScreen> createState() => _PositionedScreenState();
}

class _PositionedScreenState extends State<PositionedScreen>
    with SingleTickerProviderStateMixin {
  bool collapsedLeft = true;
  bool collapsedRight = true;
  bool collapsedTop = true;
  bool collapsedBottom = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _topAction() {
    setState(() {
      collapsedTop
          ? _animationController.forward()
          : _animationController.reverse();
      collapsedTop = !collapsedTop;
    });
  }

  void _bottomAction() {
    setState(() {
      collapsedBottom
          ? _animationController.forward()
          : _animationController.reverse();
      collapsedBottom = !collapsedBottom;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: [
          upperBar(),
          bottomBar(),
          AnimatedPositioned(
            left: collapsedLeft ? 0 : 0.5 * screenWidth,
            right: collapsedRight ? 0 : -0.2 * screenWidth,
            top: collapsedTop ? 0 : 0.1 * screenHeight,
            bottom: collapsedBottom ? 0 : 0.1 * screenHeight,
            duration: duration,
            curve: Curves.easeInCubic,
            child: dashboard(context),
          ),
        ],
      ),
    );
  }

  Widget upperBar() {
    return Positioned(
      top: 40,
      left: 30,
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person_outline),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'User name',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 35,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const RoundedRectangleBorder(),
            ),
            child: const Text('View Profile'),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      bottom: 10,
      left: 30,
      child: Row(
        children: [
          const Text(
            'Reset Password',
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          const SizedBox(width: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const RoundedRectangleBorder(),
            ),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.card,
        animationDuration: duration,
        elevation: 10,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Animated Positioned'),
            actions: [
              IconButton(
                onPressed: () => _topAction(),
                icon: collapsedTop
                    ? const Icon(Icons.arrow_drop_down_rounded)
                    : const Icon(Icons.arrow_drop_up_rounded),
              ),
            ],
          ),
          body: SizedBox(
            height: 100,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, HeroImage.routeName),
              child: Hero(
                flightShuttleBuilder: (flightContext, animation, direction,
                    fromContext, toContext) {
                  return Image.asset('assets/images/tshirt.jpg');
                },
                tag: 'tshirt',
                child: Image.asset('assets/images/tshirt.jpg'),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _bottomAction(),
            child: collapsedBottom
                ? const Icon(Icons.arrow_drop_down_rounded)
                : const Icon(Icons.arrow_drop_up_rounded),
          ),
        ),
      ),
    );
  }
}
