
import 'package:flutter/material.dart';

class TextedDevider extends StatelessWidget {
  const TextedDevider({
    super.key, required this.text,
  });

 final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffD1FAE5),
            thickness: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffD1FAE5),
            thickness: 3,
          ),
        ),
      ],
    );
  }
}
