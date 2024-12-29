import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:r4everstore/utils/constant.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool loading;
  final Color color;
  final Color color1;
  final Color titleColor;
  final VoidCallback onTap;

  const AppButton({
    super.key,
    required this.title,
    this.loading = false,
    this.color = K.indigo,
    this.color1 = K.indigo,
    this.titleColor = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: !loading ? onTap : () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                // blurRadius: 1,
                offset: Offset(1, 1)
              )
            ],
            gradient: LinearGradient(
              colors: [
                color,
                color1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: loading ?
              LoadingAnimationWidget.fourRotatingDots(color: Colors.white, size: 20)
            : Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: titleColor,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
          ),
        ),
    );
  }
}
