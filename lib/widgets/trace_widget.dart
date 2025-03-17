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
        int pomoQuantity = timerModel.pomoQuantity;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pomoQuantity >= 1 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  Color.fromRGBO(102, 76, 255, 1) ,
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
                color: Color.fromRGBO(102, 76, 255, 1)
              ),
              pomoQuantity >= 2 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(102, 76, 255, 1),
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
                  color: Color.fromRGBO(102, 76, 255, 1)
              ),
              pomoQuantity >= 3 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(102, 76, 255, 1),
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
                  color: Color.fromRGBO(102, 76, 255, 1)
              ),
              pomoQuantity >= 4 ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  Color.fromRGBO(102, 76, 255, 1),
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