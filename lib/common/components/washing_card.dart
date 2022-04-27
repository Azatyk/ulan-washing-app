import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moika/common/components/main_button.dart';
import 'package:moika/common/constants/app_colors.dart';

class WashingCard extends StatelessWidget {
  const WashingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
          color: AppColors.white,
          border:
              Border(bottom: BorderSide(color: AppColors.grey, width: 8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "VIP Palace",
                style: TextStyle(color: AppColors.darkGrey, fontSize: 24),
              ),
              CupertinoButton(
                child: const FaIcon(
                  FontAwesomeIcons.heart,
                  size: 24,
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            "ул. Ангарская, д. 87/1",
            style: TextStyle(color: AppColors.darkGrey, fontSize: 18),
          ),
          const SizedBox(height: 10),
          const RatingInfo(),
          const SizedBox(height: 10),
          RichText(
              text: const TextSpan(
                  text: "· ",
                  style: TextStyle(color: AppColors.green, fontSize: 26),
                  children: [
                TextSpan(
                    text: "Открыто до 22:00 ",
                    style: TextStyle(color: AppColors.lightGrey, fontSize: 18)),
                TextSpan(
                    text: " 2 свободных места",
                    style: TextStyle(color: AppColors.darkGrey, fontSize: 18))
              ])),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "от 1500 KZT",
                style: TextStyle(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              MainButton(text: "Забронировать", onClick: () {})
            ],
          )
        ],
      ),
    );
  }
}

class RatingInfo extends StatelessWidget {
  const RatingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        FaIcon(
          FontAwesomeIcons.star,
          color: AppColors.primaryRed,
        ),
        SizedBox(width: 2),
        FaIcon(
          FontAwesomeIcons.star,
          color: AppColors.primaryRed,
        ),
        SizedBox(width: 2),
        FaIcon(
          FontAwesomeIcons.star,
          color: AppColors.primaryRed,
        ),
        SizedBox(width: 2),
        FaIcon(
          FontAwesomeIcons.star,
          color: AppColors.primaryRed,
        ),
        SizedBox(width: 2),
        FaIcon(
          FontAwesomeIcons.star,
          color: AppColors.primaryRed,
        ),
        SizedBox(width: 12),
        Text(
          "(2 отзыва)",
          style: TextStyle(color: AppColors.lightGrey, fontSize: 16),
        )
      ],
    );
  }
}
