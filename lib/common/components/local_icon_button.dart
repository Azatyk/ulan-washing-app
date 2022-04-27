import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_colors.dart';

class LocalIconButton extends StatelessWidget {
  const LocalIconButton({Key? key, required this.icon, required this.onClick})
      : super(key: key);

  final IconData icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CupertinoButton(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(40),
          padding: const EdgeInsets.all(0),
          child: FaIcon(
            icon,
            size: 24,
            color: AppColors.darkGrey,
          ),
          onPressed: () {
            onClick();
          }),
    );
  }
}
