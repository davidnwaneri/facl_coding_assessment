import 'package:facl_locker_room/theme/app_colours.dart';
import 'package:facl_locker_room/util/extensions.dart';
import 'package:flutter/material.dart';

class ReuseableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool showBorderOutline;
  final Color? bgColour;
  final Size? size;
  final Color? textColour;
  final double? textSize;

  const ReuseableButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.showBorderOutline = false,
    this.size,
    this.bgColour = AppColours.purpleShadeDeep,
    this.textColour = Colors.white,
    this.textSize = 11,
  });

  /// Returns an instance of `ReuseableButton` with a border outline.
  factory ReuseableButton.outlined({
    Key? key,
    required VoidCallback onPressed,
    required String text,
  }) {
    return ReuseableButton(
      key: key,
      onPressed: onPressed,
      text: text,
      showBorderOutline: true,
      size: const Size(double.infinity, 55),
      bgColour: null,
      textColour: null,
      textSize: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: context.theme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: MaterialStateProperty.all(bgColour),
        minimumSize: MaterialStateProperty.all(size),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: showBorderOutline
                ? const BorderSide(
                    color: AppColours.greyish,
                  )
                : BorderSide.none,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: context.theme.elevatedButtonTheme.style?.textStyle?.resolve({
          MaterialState.pressed,
        })?.copyWith(color: textColour, fontSize: textSize),
      ),
    );
  }
}
