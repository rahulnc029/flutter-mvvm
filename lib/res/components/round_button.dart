


import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({
    required this.title,
    this.loading = false,
    required this.onPress,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: const BoxDecoration(
          color: AppColors.buttonColor
        ),
        child: Center(
            child: loading ? const CircularProgressIndicator(color: Colors.white,) : Text(
                title,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18
              ),
            )
        ),
      ),
    );
  }
}
