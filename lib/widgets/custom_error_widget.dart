import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:r4everstore/utils/constant.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({super.key, this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
