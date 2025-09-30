import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/stat_display.dart';
import 'package:flutter/material.dart';

class AnimeStatsRow extends StatelessWidget {
  final AnimeDetailEntity details;

  const AnimeStatsRow({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatDisplay(image: AssetsString.view, label: AppString.views),
        StatDisplay(image: AssetsString.claap, label: AppString.clap),
        StatDisplay(image: AssetsString.season, label: AppString.season),
      ],
    );
  }
}
