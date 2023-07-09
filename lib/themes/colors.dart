import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFFF2F5FF);
const Color kTextColor = Color(0xFF2E3A59);
const Color kDisabledColor = Color(0xFFbbc1d0);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kPurpleColor = Color(0xFFe5eafc);
const Color kPrimaryColor = Color(0xFF913df4);
const Color kSecondaryColor = Color(0xFF5740f7);
const Color kTransparantColor = Color(0xFF00FFFFFF);

const Gradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    kPrimaryColor,
    kSecondaryColor,
  ],
);

const Gradient kSecondGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    kPrimaryColor,
    kSecondaryColor,
    kSecondaryColor,
  ],
);

const Gradient kDisableGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    kDisabledColor,
    kDisabledColor,
  ],
);
