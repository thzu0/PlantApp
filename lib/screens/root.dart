import 'package:flutter/material.dart';

///==================================
///this page is for const app bar and const nav
///==================================
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('RootPage')));
  }
}
