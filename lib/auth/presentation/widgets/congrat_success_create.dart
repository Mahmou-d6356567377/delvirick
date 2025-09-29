import 'package:flutter/material.dart';

class CongratSuccessCreate extends StatelessWidget {
  const CongratSuccessCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/images/image4.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * (300 / 811),
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/success.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Congrats!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xff10B981),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Your Profile Is Ready To Use',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
        ],
      ),
    );
  }
}
