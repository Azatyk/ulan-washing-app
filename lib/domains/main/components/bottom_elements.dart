import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moika/common/components/local_icon_button.dart';
import 'package:moika/common/constants/app_colors.dart';

class BottomElements extends StatelessWidget {
  const BottomElements({Key? key, required this.onListButtonClicked})
      : super(key: key);

  final Function onListButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Buttons(
        onListButtonClicked: () {
          onListButtonClicked();
        },
      ),
      const SizedBox(height: 20),
      const MainFunctions()
    ]);
  }
}

class MainFunctions extends StatelessWidget {
  const MainFunctions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12), topEnd: Radius.circular(12))),
      child: Row(
        children: [
          Expanded(
            child: FunctionButton(
                image: const AssetImage("assets/images/washing-out.png"),
                text: "Мойка кузова",
                onClick: () {}),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FunctionButton(
                image: const AssetImage("assets/images/washing-in.png"),
                text: "Мойка салона",
                onClick: () {}),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FunctionButton(
                image: const AssetImage("assets/images/washing-in-out.png"),
                text: "Кузов и салон",
                onClick: () {}),
          ),
        ],
      ),
    );
  }
}

class FunctionButton extends StatelessWidget {
  const FunctionButton(
      {Key? key,
      required this.image,
      required this.text,
      required this.onClick})
      : super(key: key);

  final AssetImage image;
  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primaryRed),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: image,
            width: 50,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.darkGrey, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.onListButtonClicked})
      : super(key: key);

  final Function onListButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingListButton(onListButtonClicked: () {
            onListButtonClicked();
          }),
          LocalIconButton(icon: FontAwesomeIcons.locationArrow, onClick: () {})
        ],
      ),
    );
  }
}

class FloatingListButton extends StatelessWidget {
  const FloatingListButton({Key? key, required this.onListButtonClicked})
      : super(key: key);

  final Function onListButtonClicked;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        color: AppColors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            FaIcon(
              FontAwesomeIcons.listUl,
              size: 22,
              color: AppColors.darkGrey,
            ),
            SizedBox(width: 10),
            Text(
              "Cписок",
              style: TextStyle(color: AppColors.darkGrey, fontSize: 18),
            )
          ],
        ),
        onPressed: () {
          onListButtonClicked();
        });
  }
}
