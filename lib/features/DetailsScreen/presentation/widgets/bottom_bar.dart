import 'package:anime_alive/features/UpgradePlan/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:flutter/material.dart';
import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:anime_alive/core/widgets/custom_elevated_button.dart';
import 'package:anime_alive/features/UpgradePlan/presentation/screens/upgrade_plane.dart';

class AnimeDetailBottomBar extends StatelessWidget {
  final GetSubscriptionPlansUseCase getPlansUseCase;

  const AnimeDetailBottomBar({super.key, required this.getPlansUseCase});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomElevatedButton(
              image: AssetsString.views,
              text: AppString.preview,
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.greys.withValues(alpha: 0.4),
                foregroundColor: ColorApp.white,
                side: const BorderSide(color: ColorApp.greylight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(37),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomElevatedButton(
              image: AssetsString.watch,
              text: AppString.watchNow,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UpgradePlanScreen(getPlansUseCase: getPlansUseCase),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: ColorApp.white,
                backgroundColor: ColorApp.purpleslight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(37),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
