import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moika/common/components/tag_button.dart';
import 'package:moika/common/constants/app_colors.dart';
import '../../../common/components/local_icon_button.dart';

class TopElements extends StatelessWidget {
  const TopElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Flexible(child: Header()),
        SizedBox(height: 20),
        Flexible(child: Buttons())
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 0, 8),
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
              child: const FaIcon(
                FontAwesomeIcons.slidersH,
                size: 24,
                color: AppColors.darkGrey,
              ),
              onPressed: () {}),
          const SizedBox(width: 6),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  TagButton(text: "Свободно", onClick: () {}),
                  const SizedBox(width: 12),
                  TagButton(text: "Открыто", onClick: () {}),
                  const SizedBox(width: 12),
                  TagButton(text: "Круглосуточно", onClick: () {}),
                  const SizedBox(width: 12),
                  TagButton(text: "С отзывами", onClick: () {}),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocalIconButton(icon: FontAwesomeIcons.user, onClick: () {}),
          LocalIconButton(icon: FontAwesomeIcons.bookmark, onClick: () {}),
        ],
      ),
    );
  }
}
