import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/Anime_stats_row.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/anime_description.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/anime_header.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/bottom_bar.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/divider_widget.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/widgets/genre_tags.dart';
import 'package:anime_alive/features/UpgradePlan/data/datasources/subscription_plan_local_data_source.dart';
import 'package:anime_alive/features/UpgradePlan/data/repositories/subscription_plan_repository_impl.dart';
import 'package:anime_alive/features/UpgradePlan/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  final AnimeDetailEntity details;

  const AnimeDetailScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final localDataSource = SubscriptionPlanLocalDataSourceImpl();
    final repository = SubscriptionPlanRepositoryImpl(localDataSource);
    final getPlansUseCase = GetSubscriptionPlansUseCase(repository);

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AssetsString.rectangle, fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AnimeHeader(
                  backdropPath: details.backdropPath,
                  posterPath: details.posterPath,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    GenreTags(genres: details.genres),
                    const SizedBox(height: 10),
                    const DividerWidget(),
                    const SizedBox(height: 10),
                    AnimeStatsRow(details: details),
                    const SizedBox(height: 10),
                    const DividerWidget(),
                    const SizedBox(height: 10),
                    DescriptionWidget(description: details.description),
                  ]),
                ),
              ),
            ],
          ),

          bottomNavigationBar: AnimeDetailBottomBar(
            getPlansUseCase: getPlansUseCase,
          ),
        ),
      ],
    );
  }
}
