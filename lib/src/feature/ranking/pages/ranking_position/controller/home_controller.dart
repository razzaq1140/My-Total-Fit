import 'package:flutter/material.dart';

class CustomerHomeController extends ChangeNotifier {
  double _bottomSheetHeight = 240;
  final double _minHeight = 240;
  bool? locationAllowed;

  double get bottomSheetHeight => _bottomSheetHeight;

  void setBottomSheetHeight(DragUpdateDetails details) {
    _bottomSheetHeight -= details.delta.dy;
    if (_bottomSheetHeight < _minHeight) {
      _bottomSheetHeight = _minHeight;
    }
    notifyListeners();
  }
}
