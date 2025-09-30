import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/screens/details_screen.dart';
import 'package:anime_alive/features/anime_home_screen/domain/entities/anime_series.dart';
import 'package:flutter/material.dart';


class AnimeSeriesList extends StatelessWidget {
  final Future<List<AnimeSeries>> getAnimeSeries;


  const AnimeSeriesList({super.key, required this.getAnimeSeries, });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeSeries>>(
      future: getAnimeSeries,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final series = snapshot.data!;
        return SizedBox(
          height: 247,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: series.length,
            itemBuilder: (context, index) {
              final anime = series[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimeDetailScreen(
                        details: AnimeDetailEntity(

                          title: anime.name,
                          description: AppString.demonSlayer,
                          genres: [
                            AppString.darkFantasy,
                            AppString.action,
                            AppString.adventure,
                          ],
                          backdropPath: AssetsString.demons,

                          posterPath: AssetsString.demon,
                        

                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 150,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 184,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(anime.image, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        anime.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.bold(fontSize: 14),
                      ),
                      Text(
                        anime.type,
                        style: AppTextStyles.medium(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
