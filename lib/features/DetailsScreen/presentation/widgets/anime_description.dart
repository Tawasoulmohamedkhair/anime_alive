import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetsString.vector),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            description,
            style: AppTextStyles.medium(
              fontSize: 14,
              color: ColorApp.greylight,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
