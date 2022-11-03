import 'dart:async';
import 'dart:ui';

class DelayTimer {
  int milliseconds;
  VoidCallback? dlAction;
  Timer? _timer;

  DelayTimer({required this.milliseconds});

  void run(VoidCallback action) {
    dlAction = action;
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), dlAction!);
  }
}
