import 'package:flutter/material.dart';

class Imob extends StatelessWidget {
  const Imob({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 25,
      width: 30,
decoration: BoxDecoration(
  image: const DecorationImage( fit: BoxFit.fill,image: AssetImage('assets/889199.png'))
),

    );
  }
}