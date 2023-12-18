// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_12/widgets/calcuteButtons.dart';
import 'package:flutter_application_12/widgets/calcutesResult.dart';

class PageContents extends StatefulWidget {
  const PageContents({super.key});

  @override
  State<PageContents> createState() => _PageContentsState();
}

class _PageContentsState extends State<PageContents> {
  String hesap = "0";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        calc_result(hesap: hesap),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: calc_buttons(onCalcuted: (calc) {
              setState(() {
                hesap = calc;
              });
            }),
          ),
        ),
      ],
    );
  }
}
