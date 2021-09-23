import 'package:mobx/mobx.dart';

class ValueChanger {
  Action increaseval = Action(() {});
  Action decreaseval = Action(() {});
  Action tozero = Action(() {});
  final _value = Observable(0);
  final _lowval = Observable('');
  final _highval = Observable('');

  ValueChanger() {
    this.increaseval = Action(_increaseVal);
    this.decreaseval = Action(_decreaseVal);
    this.tozero = Action(_tozero);
  }

  int get changed => _value.value;
  String get lowval => _lowval.value;
  String get highval => _highval.value;

  void _increaseVal() {
    _value.value++;
  }

  void _decreaseVal() {
    _value.value--;
  }

  void _tozero() {
    _value.value = 0;
    _lowval.value = '';
    _highval.value = '';
  }

  void checkStatus() {
    if (_value.value < 0) {
      _lowval.value = 'TOO LOW';
    } else if (_value.value > 5) {
      _highval.value = 'TOO HIGH';
    } else {
      _highval.value = '';
      _lowval.value = '';
    }
  }
}
