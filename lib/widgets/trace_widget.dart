import 'package:flutter/material.dart';
import 'package:focusplus/models/timer_model.dart';
import 'package:provider/provider.dart';

class TraceWidget extends StatefulWidget {

  @override
  _TraceWidgetState createState() => _TraceWidgetState();
}

class _TraceWidgetState extends State<TraceWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<TimerModel>(
      builder: (context, timerModel, child) {
        bool isLineRelaxed = timerModel.sessionType == SessionType.relaxed || timerModel.sessionType == SessionType.long_relaxed;
        int _pomoQuantity = timerModel.pomoQuantity;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pomoQuantity == 1 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  timerModel.sessionType == SessionType.pomo ? Color.fromRGBO(102, 76, 255, 1) : Colors.blue,
                  shape: BoxShape.circle,
                ),
              ) : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  border: Border.all(
                    color: Color.fromRGBO(102, 76, 255, 1),
                    width: 5,
                  ),
                ),
              ),
              Container(
                height: 10,
                width: 40,
                color: isLineRelaxed ?  Colors.blue : Color.fromRGBO(102, 76, 255, 1)
              ),
              _pomoQuantity == 2 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  timerModel.sessionType == SessionType.pomo ? Color.fromRGBO(102, 76, 255, 1) : Colors.blue,
                  shape: BoxShape.circle,
                ),
              ) : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  border: Border.all(
                    color: Color.fromRGBO(102, 76, 255, 1),
                    width: 5,
                  ),
                ),
              ),
              Container(
                  height: 10,
                  width: 40,
                  color: isLineRelaxed ?  Colors.blue : Color.fromRGBO(102, 76, 255, 1)
              ),
              _pomoQuantity == 3 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  timerModel.sessionType == SessionType.pomo ? Color.fromRGBO(102, 76, 255, 1) : Colors.blue,
                  shape: BoxShape.circle,
                ),
              ) : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  border: Border.all(
                    color: Color.fromRGBO(102, 76, 255, 1),
                    width: 5,
                  ),
                ),
              ),
              Container(
                  height: 10,
                  width: 40,
                  color: isLineRelaxed ?  Colors.blue : Color.fromRGBO(102, 76, 255, 1)
              ),
              _pomoQuantity == 4 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  timerModel.sessionType == SessionType.pomo ? Color.fromRGBO(102, 76, 255, 1) : Colors.blue,
                  shape: BoxShape.circle,
                ),
              ) : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  border: Border.all(
                    color: Color.fromRGBO(102, 76, 255, 1),
                    width: 5,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}