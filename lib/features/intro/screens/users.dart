import 'package:delvirick/features/widgets/top_app_background.dart';
import 'package:delvirick/core/utils/consts/colors.dart';
import 'package:delvirick/core/utils/consts/fonts.dart';
import 'package:delvirick/core/utils/consts/imgs.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
        child: Stack(
          children: [
            
               TopAppBackground(),
            Column(
              children: [
               SizedBox(height: height * 0.33),
            
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
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(Routers.register);
                          },
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
