import 'package:flutter/material.dart';
import '../mobx_state/value_change.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatelessWidget {
  final value_changer = ValueChanger();
  @override
  Widget build(BuildContext context) {
    autorun((_) => print(' VALUE :${value_changer.changed}'));
    reaction(
      (_) => value_changer.changed,
      (p0) => value_changer.checkStatus(),
    );

    return Observer(
      builder: (_) => Container(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'HOME SCREEN',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 100),
              TextButton(
                onPressed: () {
                  value_changer.increaseval();
                },
                child: Icon(Icons.exposure_plus_1),
              ),
              TextButton(
                onPressed: () {
                  value_changer.decreaseval();
                },
                child: Icon(Icons.exposure_minus_1),
              ),
              TextButton(
                onPressed: () {
                  value_changer.tozero();
                },
                child: Icon(Icons.restart_alt_sharp),
              ),
              Text(
                value_changer.changed.toString(),
                style: TextStyle(fontSize: 40),
              ),
              Text(
                value_changer.lowval,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                value_changer.highval,
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
