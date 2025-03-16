import 'package:flutter/material.dart';
import 'package:focusplus/widgets/timer_widget.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(31, 27, 46, 1.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TimerWidget(initialTime: 120)],
        ),
      ),
    ));
  }
}
