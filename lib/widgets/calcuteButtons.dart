// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/calcute.dart';
import 'package:flutter_application_12/ui_helper/ui_ColorHelper.dart';

class calc_buttons extends StatefulWidget {
  final Function onCalcuted;
  const calc_buttons({
    Key? key,
    required this.onCalcuted,
  }) : super(key: key);

  @override
  State<calc_buttons> createState() => calc_buttonsState();
}

class calc_buttonsState extends State<calc_buttons> {
  String hesap = "0";
  bool butonPressed = true;
  bool noktagirdiMi = false;
  double toplam = 0;
  double gelen = 0;
  String? islem = null;
  Color tapColor = ColorHelper.TapColor;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      rows(context, ["AC", "+/-", "%", "/"]),
      rows(context, ["7", "8", "9", "x"]),
      rows(context, ["4", "5", "6", "-"]),
      rows(context, ["1", "2", "3", "+"]),
      rows(context, ["0", ".", "="]),
    ]);
  }

  Flexible rows(BuildContext context, List dizi) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buttonbox(context, dizi[0]),
          buttonbox(context, dizi[1]),
          buttonbox(context, dizi[2]),
          dizi.length == 4 ? buttonbox(context, dizi[3]) : Container(),
        ],
      ),
    );
  }

  Widget buttonbox(BuildContext context, String text) {
    Color butonColor = ColorHelper.buttonColor(text);
    return InkWell(
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return ColorHelper.ACbuttonColor;
      }),
      onTap: () {
        if (text.codeUnitAt(0) >= 48 && text.codeUnitAt(0) <= 57) {
          if (hesap == "0") {
            hesap = " ";
          }
          if (butonPressed) {
            butonPressed = false;
            hesap = text;
          } else {
            hesap += text;
          }
        } else if (text == ".") {
          butonPressed = false;
          gelen = double.parse(hesap);
          if (gelen % 1 == 0) {
            hesap += text;
          }
          noktagirdiMi = true;
        } else if (text == "AC") {
          hesap = "0";
          butonPressed = false;
          toplam = 0;
          gelen = 0;
          islem = null;
        } else if (text == "=") {
          butonPressed = true;

          if (hesap == " " || islem == null) {
            hesap = toplam.toString();
          } else {
            gelen = double.parse(hesap);
            toplam = Calcute.hesapla(toplam, gelen, islem);

            if (toplam % 1 == 0) {
              hesap = toplam.toInt().toString();
            } else {
              hesap = toplam.toString();
            }
          }
        } else {
          if (butonPressed) {
            toplam = double.parse(hesap);
            islem = text;
          } else {
            butonPressed = true;
            gelen = double.parse(hesap);
            islem = text;
            if (toplam == 0) {
              hesap = " ";
              toplam = gelen;
            } else if (noktagirdiMi) {
              hesap = " ";
              toplam = gelen;
              noktagirdiMi = false;
            } else {
              toplam = Calcute.hesapla(toplam, gelen, islem);
              if (toplam % 1 == 0) {
                hesap = toplam.toInt().toString();
              } else {
                hesap = toplam.toString();
              }
            }
          }
        }

        widget.onCalcuted(hesap);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: text == "0"
              ? (MediaQuery.of(context).size.width / 4.1) * 2
              : (MediaQuery.of(context).size.width) / 4.3,
          height: (MediaQuery.of(context).size.height / 1.25) / 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: (butonPressed == true && text == islem)
                  ? butonColor.withOpacity(0.7)
                  : butonColor),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontFamily:
                    (text.codeUnitAt(0) >= 48 && text.codeUnitAt(0) <= 57 ||
                            text == ".")
                        ? "sfLight"
                        : "sf",
                fontSize: (MediaQuery.of(context).size.height / 1.25) / 13,
                color: (text == "AC" || text == "+/-" || text == "%")
                    ? ColorHelper.ACbuttonColor
                    : ColorHelper.buttonColors),
          )),
        ),
      ),
    );
  }

  
}
