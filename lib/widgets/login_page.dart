import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/default_text_animated.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          const Text(
            'Login',
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 80,
          ),
          const TextField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: 'Enter Username', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Enter Password', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              minimumSize: const Size(100, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, DefaultTextAnimation.routeName),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Not a member yet?',
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              minimumSize: const Size(double.infinity, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Signup',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
