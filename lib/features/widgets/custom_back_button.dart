
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustombackButton extends StatelessWidget {
  const CustombackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 65,
      left: 25,
      child: IconButton(
        style: IconButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 14,
          ),
          minimumSize: const Size(48, 48),
          backgroundColor: const Color(0xffF7F5ED),
          foregroundColor: const Color(0xffA97B3D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, size: 40),
      ),
    );
  }
}
