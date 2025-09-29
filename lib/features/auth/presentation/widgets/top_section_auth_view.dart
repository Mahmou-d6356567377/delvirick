import 'package:flutter/material.dart';

class TopSectionAuthView extends StatelessWidget {
  const TopSectionAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.445,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/image.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 54,
            right: 35,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 14,
                ),
                minimumSize: const Size(0, 36),
                backgroundColor: const Color(0xffD1FAE5),
                foregroundColor: const Color(0xff10B981),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/image2.png',
                height: MediaQuery.of(context).size.height * 0.445 - 90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
