import 'package:flutter/material.dart';

void main() {
  runApp(sayfa44());
}

class sayfa44 extends StatelessWidget {
  const sayfa44({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/4.jpg'),
      height: 80,
      width: 100,
    );
  }
}
