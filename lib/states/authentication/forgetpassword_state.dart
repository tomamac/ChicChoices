import 'dart:async';
import 'package:flutter/material.dart';

class ForgetPasswordState extends ChangeNotifier {
  bool isOtpEnabled = false;
  bool isButtonEnabled = true;
  int countdown = 60;

  void enableOtpTextField() {
    isOtpEnabled = true;

    startCountdown();

    notifyListeners();
  }

  void startCountdown() {
    isButtonEnabled = false;
    countdown = 60;

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (countdown == 0) {
        isButtonEnabled = true;
        timer.cancel();

        notifyListeners();
      } else {
        countdown--;

        notifyListeners();
      }
    });
  }
}
