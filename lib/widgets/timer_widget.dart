import 'package:flutter/material.dart';
import 'package:focusplus/models/timer_model.dart';
import 'package:focusplus/widgets/trace_widget.dart';
import 'package:provider/provider.dart';
import 'dart:async';



class TimerWidget extends StatefulWidget {
  // int initialTime = 1500;
  int initialTime = 10;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int timeLeft;
  Timer? _timer;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    timeLeft = widget.initialTime;
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      isPaused = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    double progress = timeLeft / widget.initialTime;

    return Consumer<TimerModel>(
      builder: (context, timerModel, child) {
        if (progress == 0 && timerModel.sessionType == SessionType.pomo && timerModel.pomoQuantity < 4) {
          timerModel.sessionType = SessionType.relaxed;
          timeLeft = 20;
          _startTimer();
        } else if ( progress == 0 && timerModel.sessionType == SessionType.relaxed ) {
          timerModel.sessionType = SessionType.pomo;
          timeLeft = 20;
          _startTimer();
        }
        else if (progress == 0) {
          _timer?.cancel();
        }

        return Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: Consumer<TimerModel>(
                        builder: (context, timerModel, child) {
                          return CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey.shade800,
                            color: timerModel.sessionType == SessionType.pomo ? Color.fromRGBO(102, 76, 255, 1) : Colors.blue,
                          );
                        },
                      ),
                    ),
                    Text(
                      _formatTime(timeLeft),
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 64,
                width: 100,
              ),
              // TraceWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _pauseTimer();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(44, 44, 59, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15)),
                      child: Text(
                        "Parar",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _startTimer();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(102, 76, 255, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15)),
                      child: Text(
                        "Iniciar",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
