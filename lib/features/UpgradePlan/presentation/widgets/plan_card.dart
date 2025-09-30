import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final bool isSelected;
  final VoidCallback onTap;

  const PlanCard({
    required this.title,
    required this.price,
    required this.period,
    this.isSelected = false,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? ColorApp.purpledark : ColorApp.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? ColorApp.purpledark : ColorApp.greylight,
            width: isSelected ? 3.0 : 1.0,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: ColorApp.purpledark.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 8,
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(AssetsString.files),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bold(
                      fontSize: 16,
                      color: isSelected ? ColorApp.white : ColorApp.purpledark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$$price USD',
                        style: AppTextStyles.bold(
                          fontSize: 14,
                          color: isSelected
                              ? ColorApp.white
                              : ColorApp.purpledark,
                        ),
                      ),
                      Text(
                        ' / $period',
                        style: AppTextStyles.bold(
                          fontSize: 14,
                          color: ColorApp.purple,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppString.includeFamilySharing,
                    style: AppTextStyles.bold(
                      fontSize: 12,
                      color: ColorApp.purple.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? const Color(0xFF5436F8) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
