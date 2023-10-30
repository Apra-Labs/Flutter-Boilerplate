import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/color_schemes.dart';
import 'package:flutter_boilerplate/widgets/spinner.dart';

class LoadingUtils {
  late BuildContext context;

  LoadingUtils(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SimpleDialog(
            elevation: 0.0,
            backgroundColor: AppColorsPalette.transparent,
            children: <Widget>[
              Center(
                child: CircularProgress(),
              )
            ],
          );
        });
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }
}
