import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({Key? key, this.onPress, this.title, this.height, this.width, required this.radius, this.color}) : super(key: key);
  final VoidCallback? onPress;
  final String? title;
  final double? height;
  final double? width;
  final double radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1, color: color!),
            color: Colors.white),
        child: Center(
            child: Text(
              title!,
              style: Styles.white16.copyWith(
                  color: color!,
                  fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
