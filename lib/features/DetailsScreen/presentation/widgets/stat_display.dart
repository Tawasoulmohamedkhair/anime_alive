import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class StatDisplay extends StatelessWidget {
  final String? value;
  final String label;
  final String image;

  const StatDisplay({
    super.key,
    this.value,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, height: 17, width: 17),
        const SizedBox(height: 4),
        Text(
          value ?? '',
          style: AppTextStyles.regular(fontSize: 12, color: ColorApp.white),
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.regular(fontSize: 14, color: ColorApp.white),
        ),
      ],
    );
  }
}
