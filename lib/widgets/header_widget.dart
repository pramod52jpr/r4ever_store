import 'package:flutter/material.dart';
import 'package:r4everstore/utils/images.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: const BoxDecoration(
          // color: Colors.black
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Images.logo, height: 50),
        ],
      ),
    );
  }
}
