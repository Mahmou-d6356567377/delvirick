import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/widgets/custom_back_button.dart';
import 'package:delvirick/core/utils/consts/colors.dart';
import 'package:delvirick/core/utils/consts/fonts.dart';
import 'package:delvirick/core/utils/consts/imgs.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:delvirick/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/image3.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
        
                  CustombackButton(),
        
                  Positioned(
                    top: 128,
                    left: 10,
                    child: Column(
                      children: [
                        const Text(
                          textAlign:  TextAlign.left,
                          'Set Your Location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        
                        Text(
                      'This details will be displayed in your account profile',
                      style: ConstFonts.fontnormalgray,
                    ),
                      ],
                    ),
                  ),
        
                 
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                spacing: 30,
                children: [
                  
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: ConstColors.lightgreen, width: 2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(ConstImgs.pinloc),
                            SizedBox(width: 8),
                            Text(
                              'Your location',
                              style:ConstFonts.fontboldgreen,
                            ),
                          ],
                        ),
                        CustomButton(
                          onpress: () {
                           GoRouter.of(context).push(Routers.mapaddressingscreen);
                          },
                          title:  'Next',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
