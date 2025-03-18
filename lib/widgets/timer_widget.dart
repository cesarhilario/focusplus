import 'package:flutter/material.dart';
import 'package:focusplus/models/timer_model.dart';
import 'package:focusplus/widgets/trace_widget.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../models/timer_model.dart';

class TimerWidget extends StatefulWidget {
  final int initialTime;

  TimerWidget({required this.initialTime});

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

  void _startTimer(TimerModel timerModel) {
    if (_timer != null && _timer!.isActive) return;
    if(timerModel.pomoQuantity == 4 && timerModel.relaxedQuantity == 3){
      timerModel.sessionType = SessionType.relaxed;
      timeLeft = timerModel.pomoTime;
      timerModel.pomoQuantity = 0;
      timerModel.relaxedQuantity = 0;

    }
    if (timeLeft == 0) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {

      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        _timer?.cancel();
      }
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
        debugPrint("pomoQuantity${timerModel.pomoQuantity}");
        debugPrint("relaxedQuantity${timerModel.relaxedQuantity}");
        if (progress == 0 && timerModel.sessionType == SessionType.pomo && timerModel.pomoQuantity <= 4)  {
          timerModel.pomoQuantity++;
            if (timerModel.pomoQuantity >= 1){
              timerModel.sessionType = SessionType.relaxed;
              timeLeft = timerModel.relaxedTime;
              _startTimer(timerModel);
            }

            if(timerModel.pomoQuantity == 4) {
              timerModel.sessionType = SessionType.long_relaxed;
              timeLeft = timerModel.longRelaxedTime;
              _startTimer(timerModel);
            }
        }
        else if ( progress == 0 && timerModel.sessionType == SessionType.relaxed && timerModel.relaxedQuantity < 3) {
          timerModel.sessionType = SessionType.pomo;
          if(timerModel.pomoQuantity >= 1) {
            timerModel.relaxedQuantity++;
          }
          timeLeft = timerModel.pomoTime;
          _startTimer(timerModel);
        }
        else if (progress == 0) {
          timeLeft = 0;
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
              TraceWidget(),
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
                        _startTimer(timerModel);
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
