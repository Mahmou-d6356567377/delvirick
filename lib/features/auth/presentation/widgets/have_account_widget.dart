
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: Color(0xff7A7A7A),
            fontSize: 15,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routers.login);
          },
          child: Text(
            'Log in',
            style: TextStyle(
              color: Color(0xff10B981),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
