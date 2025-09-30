import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/core/constants/categories.dart';
import 'package:anime_alive/features/anime_home_screen/data/datasource/anime_mock_data_source.dart';
import 'package:anime_alive/features/anime_home_screen/data/repository/anime_repository_impl.dart';
import 'package:anime_alive/features/anime_home_screen/domain/entities/anime_series.dart';
import 'package:anime_alive/features/anime_home_screen/domain/repository/anime_repository.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/widgets/anime_category_tabs.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/widgets/anime_series_list.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/widgets/top_characters.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';

class AnimeHomeScreen extends StatefulWidget {
  const AnimeHomeScreen({super.key});

  @override
  State<AnimeHomeScreen> createState() => _AnimeHomeScreenState();
}

class _AnimeHomeScreenState extends State<AnimeHomeScreen> {
  String _selectedCategory = "All";
  late Future<List<AnimeSeries>> getAnimeSeries;
  late AnimeRepository repository;
  late Future<List<Character>> getTopCharacters;


  @override
  void initState() {
    super.initState();
    final dataSource = AnimeMockDataSource();
    repository = AnimeRepositoryImpl(dataSource);
    getAnimeSeries = repository.getAnimeSeries();
    getTopCharacters = repository.getTopCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsString.homebg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  AppString.appName,
                  style: AppTextStyles.bold(fontSize: 24),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverToBoxAdapter(
                child: AnimeCategoryTabs(
                  categories: categories,
                  onCategorySelected: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 247,
                  child: AnimeSeriesList(getAnimeSeries: getAnimeSeries,),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),

              if (_selectedCategory == AppString.all) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      AppString.topCharacters,
                      style: AppTextStyles.bold(fontSize: 20),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: TopCharactersList(getTopCharacters: getTopCharacters),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
