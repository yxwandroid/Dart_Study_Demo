import 'dart:async';
main() {
 var timer =  new Timer.periodic( Duration(seconds:10), (Timer t) => print('hi!'));
  timer.cancel();

}