import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  /// An extension method on `BuildContext` that returns the `ThemeData` of the current `BuildContext`.
  ThemeData get theme => Theme.of(this);
  /// An extension method on `BuildContext` that returns the `TextTheme` of the current `BuildContext`.
  TextTheme get textTheme => theme.textTheme;
}