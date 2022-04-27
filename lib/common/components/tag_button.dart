import 'package:flutter/material.dart';
import 'package:moika/common/constants/app_colors.dart';

class TagButton extends StatelessWidget {
  const TagButton({Key? key, required this.text, required this.onClick})
      : super(key: key);

  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          side: MaterialStateProperty.all(
            const BorderSide(width: 1, color: AppColors.lightGrey),
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.lightGrey, fontSize: 16),
        ),
        onPressed: () {});
  }
}
