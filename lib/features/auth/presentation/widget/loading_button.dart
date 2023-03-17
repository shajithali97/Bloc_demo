import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

class LoadingButtonWidget extends StatelessWidget {
  const LoadingButtonWidget({
    Key? key,
    required this.isLoading,
    required this.buttonLabel,
    required this.onPressed,
    required this.height,
    required this.backgroundColor,
  }) : super(key: key);
  final bool isLoading;
  final String buttonLabel;
  final Function onPressed;
  final double height;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: MaterialButton(
        minWidth: double.infinity,
        height: height,
        color: backgroundColor,
        onPressed: () {
          onPressed();
        },
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColor.titleColor,
              )
            : Text(buttonLabel),
      ),
    );
  }
}
