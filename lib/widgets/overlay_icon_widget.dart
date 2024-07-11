import 'package:flutter/material.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/sizes.dart';

class OverlayIcon extends StatelessWidget {
  const OverlayIcon({super.key, required this.text, required this.icons});

  final String text;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(text),
          const SizedBox(
            width: AppSizes.spaceBtwSectionsSm,
          ),
          CircleAvatar(
            backgroundColor: primaryColor,
            child: Icon(
              icons,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
