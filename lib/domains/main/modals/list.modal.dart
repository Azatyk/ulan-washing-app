import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moika/common/components/washing_card.dart';
import 'package:moika/common/constants/app_colors.dart';

class WashingList extends StatelessWidget {
  const WashingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Все автомойки: 150",
                style: TextStyle(color: AppColors.darkGrey, fontSize: 18),
              ),
            ),
            CupertinoButton(
                child: const FaIcon(
                  FontAwesomeIcons.windowClose,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                WashingCard(),
                WashingCard(),
                WashingCard(),
                WashingCard(),
                WashingCard(),
                WashingCard(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
