import 'dart:ui';
import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class CreateGenreTag extends StatelessWidget {
  final String text;

  const CreateGenreTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ColorApp.white.withValues(alpha: 0.24),

            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: AppTextStyles.generattag(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
