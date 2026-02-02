import 'package:flutter/material.dart';

class RootLoadingPage extends StatelessWidget {
  const RootLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
