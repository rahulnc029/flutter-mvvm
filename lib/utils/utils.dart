

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 3),
        )..show(context)
    );
  }

  static snackBar(String message, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus,
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

}