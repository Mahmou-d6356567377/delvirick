import 'package:delvirick/core/utils/consts/colors.dart';
import 'package:delvirick/core/utils/consts/fonts.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:delvirick/core/utils/consts/imgs.dart';
import 'package:delvirick/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class MapAddressWidget extends StatelessWidget {
  const MapAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: ConstColors.lightgreen,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Your location',
                  style: ConstFonts.fontboldgreen,
                ),
                const SizedBox(height: 8),

                // Address Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ConstImgs.pinloc),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '4517 Washington Ave. Manchester, Kentucky 39495',
                        style: ConstFonts.fontboldgreen,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Button
                CustomButton(
                  onpress: () {
                    GoRouter.of(context).push(Routers.otpscreen);
                  },
                  title: 'Next',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
