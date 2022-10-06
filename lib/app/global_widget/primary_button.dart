import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

/// This class create a Button which used as a primary button through out the app
/// Create a filled button.
///
/// The [onPress] & [text] argument must not be null.

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, this.onPress, this.text}) : super(key: key);
  final VoidCallback? onPress;
  final String? text;

  @override
  Widget build(BuildContext context) => Container(
    height: Dimens.fifty,
      constraints: const BoxConstraints(maxWidth: 500),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: ColorsValue.loginButtonColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
        onPressed: onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text!,
                style: Styles.white16.copyWith(fontWeight: FontWeight.w500)//const TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ));
}


Widget secondaryButton(VoidCallback? onPress, String text) => InkWell(
  onTap: onPress,
  child: Container(
    margin: const EdgeInsets.only(
      left: 16,
      right: 16,
    ),
    height: Dimens.fourty,
    width: Dimens.screenWidth,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ColorsValue.primaryColor)),
    child: Center(
      child: Text(
        text,
        style: Styles.black14.copyWith(color: ColorsValue.primaryColor),
      ),
    ),
  ),
);
