import 'dart:async';

main() {
  // var future = Future.delayed(new Duration(milliseconds: 100), () {
  //   print("Future delayed");
  // });
  // future.then((value) => {print("Future delayed Done")});
  // scheduleMicrotask(() {
  //   print("tast");
  // });
  //
  // new Future(() => {print("Future ")});

  var task = new FutureDemo();
  var task1 = task.getTask1().then((value) => {print(value)});
}

class FutureDemo {
  Future getTask1() async {
    print("task 1");
    String task2 = await getTask2();
    print(task2);
    return "task1 ok";
  }

  Future getTask2() async {
    print("task2 ");
    return "tack 2 ok";
  }
}
