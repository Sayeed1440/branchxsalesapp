import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularCancelButton extends StatelessWidget {
  const CircularCancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.fifty,
      width: Dimens.screenWidth,
      child: Center(
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: Dimens.fourty,
            width: Dimens.fourty,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const Center(
              child: Icon(
                CupertinoIcons.clear,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
