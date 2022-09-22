import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({Key? key}) : super(key: key);
  static const routeName = '/hero-image';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Image'),
      ),
      body: Hero(
        tag: 'tshirt',
        child: Image.asset('assets/images/tshirt.jpg'),
      ),
    );
  }
}
