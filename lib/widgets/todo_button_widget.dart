import 'package:flutter/material.dart';
import 'package:todo/utils/constants/colors.dart';

class ToDoButton extends StatelessWidget {
  const ToDoButton(
      {super.key,
      required this.title,
      this.link,
      this.verticalPadding,
      this.horizontalPadding});

  final String title;
  final double? verticalPadding;
  final double? horizontalPadding;
  final void Function()? link;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 20.0,
          horizontal: horizontalPadding ?? 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        onPressed: link,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
