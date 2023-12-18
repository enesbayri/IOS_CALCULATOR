// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_application_12/ui_helper/ui_ColorHelper.dart';

class calc_result extends StatelessWidget {
  const calc_result({
    Key? key,
    required this.hesap,
  }) : super(key: key);

  final String hesap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(hesap,
                  style: TextStyle(
                      fontSize:
                          ((MediaQuery.of(context).size.height / 1.25) / 6),
                      color: ColorHelper.buttonColors)),
            )),
      ),
    );
  }
}
