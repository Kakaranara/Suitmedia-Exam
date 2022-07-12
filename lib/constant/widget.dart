import 'package:flutter/material.dart';

import 'colors.dart';

Widget newBackButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Icon(
      Icons.arrow_back_ios,
      color: backButtonColors(),
    ),
  );
}
