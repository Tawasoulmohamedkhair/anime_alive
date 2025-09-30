import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class AnimeHeader extends StatelessWidget {
  final String backdropPath;
  final String posterPath;

  const AnimeHeader({
    super.key,
    required this.backdropPath,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backdropPath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorApp.black.withValues(alpha: 0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -50,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: ColorApp.black.withValues(alpha: 0.4),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                posterPath,
                height: 147,
                width: 193,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 147,
                  width: 193,
                  color: ColorApp.greydark,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: ColorApp.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
