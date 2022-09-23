import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/align_animation.dart';
import 'package:flutter_animations/screens/cross_fade_animation.dart';
import 'package:flutter_animations/screens/decoration_transition.dart';
import 'package:flutter_animations/screens/default_text_animated.dart';
import 'package:flutter_animations/screens/hero_image.dart';
import 'package:flutter_animations/screens/home_page.dart';
import 'package:flutter_animations/screens/list_animated.dart';
import 'package:flutter_animations/screens/opacity_animated.dart';
import 'package:flutter_animations/screens/physical_model_animated.dart';
import 'package:flutter_animations/screens/positioned_screen.dart';
import 'package:flutter_animations/screens/rotate_transition.dart';
import 'package:flutter_animations/screens/size_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        SizeAnimation.routeName: (context) => const SizeAnimation(),
        AlignAnimation.routeName: (context) => const AlignAnimation(),
        PositionedScreen.routeName: (context) => const PositionedScreen(),
        HeroImage.routeName: (context) => const HeroImage(),
        CrossFadeAnimation.routeName: (context) => const CrossFadeAnimation(),
        DefaultTextAnimation.routeName: (context) =>
            const DefaultTextAnimation(),
        ListAnimated.routeName: (context) => const ListAnimated(),
        OpacityAnimated.routeName: (context) => const OpacityAnimated(),
        PhysicalModelAnimated.routeName: (context) =>
            const PhysicalModelAnimated(),
        DecorationTransition.routeName: (context) =>
            const DecorationTransition(),
        RotateTransition.routeName: (context) => const RotateTransition(),
      },
    );
  }
}
