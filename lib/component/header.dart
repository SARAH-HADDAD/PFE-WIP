import 'package:flutter/material.dart';
import 'package:smart_parking/config/responsive.dart';
import 'package:smart_parking/style/colors.dart';
import 'package:smart_parking/style/style.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                  text: 'Tableau de bord',
                  size: 30,
                  fontWeight: FontWeight.w800),
            ]),
      ),
    ]);
  }
}
