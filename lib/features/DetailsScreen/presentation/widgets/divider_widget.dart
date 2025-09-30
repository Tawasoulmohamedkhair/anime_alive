import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Divider(
      color: ColorApp.greyslight.withValues(alpha: .48),
      thickness: 1,
      height: 1,
    );
  }
}