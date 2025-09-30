import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:anime_alive/core/constants/nav_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(color: ColorApp.whitelight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(bottomNavItems.length, (index) {
          final isSelected = currentIndex == index;
          final item = bottomNavItems[index];

          return InkWell(
            onTap: () => onTap(index),
            borderRadius: BorderRadius.circular(30.r),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 14.w : 0,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: isSelected ? ColorApp.purplelight : Colors.transparent,
                borderRadius: BorderRadius.circular(isSelected ? 30.r : 12.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    item[AppString.image] as String,
                    width: 22.sp,
                    height: 22.sp,
                    color: isSelected ? ColorApp.white : ColorApp.grey,
                  ),
                  if (isSelected) ...[
                    SizedBox(width: 6.w),
                    Text(
                      item[AppString.label] as String,
                      style: AppTextStyles.semiBold(
                        fontSize: 14.sp,
                        color: ColorApp.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
