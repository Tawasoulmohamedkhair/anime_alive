import 'package:anime_alive/features/DetailsScreen/presentation/widgets/create_genre_tag.dart';
import 'package:flutter/material.dart';

class GenreTags extends StatelessWidget {
  const GenreTags({super.key, required this.genres});
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: genres
          .map(
            (genre) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CreateGenreTag(text: genre),
            ),
          )
          .toList(),
    );
  }
}
