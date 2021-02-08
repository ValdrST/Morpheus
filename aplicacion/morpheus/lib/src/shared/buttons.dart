import 'package:flutter/material.dart';
import './colors.dart';

FlatButton froyoFlatBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: white,
    color: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

IconButton froyoIconBtn(Icon icon, String tooltip, onPressed) {
  return IconButton(
    iconSize: 50,
    onPressed: onPressed,
    color: primaryColor,
    icon: icon,
    tooltip: tooltip,
    splashRadius: 100,
  );
}

OutlineButton froyoOutlineBtn(String text, onPressed) {
  return OutlineButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: primaryColor,
    highlightedBorderColor: highlightColor,
    borderSide: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
