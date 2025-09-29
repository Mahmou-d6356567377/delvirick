import 'package:delvirick/utils/consts/colors.dart';
import 'package:delvirick/utils/consts/fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onpress, required this.title});

  final String title;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text("Next", style: ConstFonts.fonttnormallight),
    );
  }
}
