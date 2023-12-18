// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_12/widgets/PageContents.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1), body: PageContents());
  }
}
