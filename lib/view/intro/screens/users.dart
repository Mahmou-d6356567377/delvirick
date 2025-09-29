import 'package:delvirick/utils/consts/colors.dart';
import 'package:delvirick/utils/consts/fonts.dart';
import 'package:delvirick/utils/consts/imgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    List<String> titles = [
      "I'm a Customer",
      "I'm a Delivery Partner",
      "I'm a Restaurant Owner"
    ];
    List<String> images = [
      ConstImgs.shopping,
      ConstImgs.truck,
      ConstImgs.storefront
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: height * 0.3,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Mask background
                  Positioned.fill(
                    child: SvgPicture.asset(ConstImgs.mask, fit: BoxFit.cover),
                  ),
                  // Logo centered horizontally, slightly overlapping bottom
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(ConstImgs.logo, height: 200),
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                     decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color:ConstColors.lightgreen,
                      ),
                      borderRadius: BorderRadius.circular(20),
                     ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        images[index],
                        height: 50,
                        width: 50,
                      ),
                      title: Text(
                        titles[index],
                        style: ConstFonts.fontboldblack,
                      ),
                      subtitle: Text(
                        "Order delicious food from local restaurants and get it delivered to your door",
                        style: ConstFonts.fontnormalgray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
