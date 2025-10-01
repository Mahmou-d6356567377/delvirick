
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialMediaSigning extends StatelessWidget {
  const SocialMediaSigning({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  List<String> authMethodsIcon = ['google', 'facebook', 'apple'];
    return Row(
      spacing: 32,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => InkWell(
          onTap: () {
            // Our Logic
            GoRouter.of(context).push(Routers.customerInfo);
          },
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xFFE5E7EB),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/${authMethodsIcon[index]}.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
