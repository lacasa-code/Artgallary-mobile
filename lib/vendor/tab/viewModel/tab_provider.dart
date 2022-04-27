import 'package:flutter/foundation.dart';

class TabProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  changeTabIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
