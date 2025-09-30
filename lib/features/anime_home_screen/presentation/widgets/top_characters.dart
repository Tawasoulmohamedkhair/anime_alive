import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:anime_alive/features/anime_home_screen/domain/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCharactersList extends StatelessWidget {
  final Future<List<Character>> getTopCharacters;
  const TopCharactersList({
    super.key,
    required this.getTopCharacters,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: getTopCharacters,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final chars = snapshot.data!;
        return SizedBox(
          height: 122,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chars.length,
            itemBuilder: (context, index) {
              final char = chars[index];
              return Container(
                width: 100,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(char.imagePath),
                      radius: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      char.name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                      style: AppTextStyles.semiBold(
                        fontSize: 16.sp,
                        color: ColorApp.purpledark,
                      ),
                    ),
                    Text(
                      char.series,
                      style: AppTextStyles.semiBold(
                        fontSize: 14.sp,
                        color: ColorApp.greydark,
                      ),

                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
