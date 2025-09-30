import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:anime_alive/core/widgets/custom_elevated_button.dart';
import 'package:anime_alive/features/UpgradePlan/domain/entities/subscription_plan_entity.dart';
import 'package:anime_alive/features/UpgradePlan/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:anime_alive/features/UpgradePlan/presentation/widgets/plan_card.dart';
import 'package:flutter/material.dart';

class UpgradePlanScreen extends StatefulWidget {
  final GetSubscriptionPlansUseCase getPlansUseCase;

  const UpgradePlanScreen({super.key, required this.getPlansUseCase});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  int? _selectedPlanId;
  late Future<List<SubscriptionPlanEntity>> _plansFuture;

  @override
  void initState() {
    super.initState();
    // Call the use case to get plans
    _plansFuture = widget.getPlansUseCase();
  }

  void _selectPlan(int id) {
    setState(() {
      _selectedPlanId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AssetsString.upgradeplan, fit: BoxFit.cover),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      AppString.upgradePlan,
                      style: AppTextStyles.bold(
                        color: ColorApp.purpledark,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorApp.whitelight,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: ColorApp.purpledark,
                        ),
                      ),
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Image.asset(AssetsString.rocketboy),
                        Text(
                          AppString.seamlessAnime,
                          style: AppTextStyles.bold(
                            color: ColorApp.purpledark,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppString.enjoyUnlimited,
                          style: AppTextStyles.medium(
                            color: ColorApp.greylights,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),

                        FutureBuilder<List<SubscriptionPlanEntity>>(
                          future: _plansFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Failed to load plans",
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            }
                            final plans = snapshot.data ?? [];
                            return Column(
                              children: plans.map((plan) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  child: PlanCard(
                                    title: plan.title,
                                    price: plan.price.toString(),
                                    period: plan.period,
                                    isSelected: _selectedPlanId == plan.id,
                                    onTap: () => _selectPlan(plan.id),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomElevatedButton(
          text: "Continue",
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.purplelight,
            foregroundColor: ColorApp.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            if (_selectedPlanId != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Selected Plan ID: $_selectedPlanId")),
              );
            }
          },
        ),
      ),
    );
  }
}
