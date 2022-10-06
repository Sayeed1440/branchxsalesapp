import 'package:flutter/material.dart';

import '../theme/theme.dart';

class Dot extends StatelessWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimens.sixTeen,
          width: Dimens.sixTeen,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.black)),
        ),
        Positioned(
          left: Dimens.four,
          right: Dimens.four,
          top: Dimens.four,
          bottom: Dimens.four,
          child: Container(
            height: Dimens.eight,
            width: Dimens.eight,
            decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}
