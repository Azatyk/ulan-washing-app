import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.text, required this.onClick})
      : super(key: key);

  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: AppColors.secondaryBlue,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        borderRadius: BorderRadius.circular(0),
        child: Text(text,
            style: const TextStyle(color: AppColors.white, fontSize: 20)),
        onPressed: () {});
  }
}
