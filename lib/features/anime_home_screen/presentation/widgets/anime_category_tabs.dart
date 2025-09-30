import 'package:anime_alive/core/constants/app_text_style.dart';
import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeCategoryTabs extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const AnimeCategoryTabs({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<AnimeCategoryTabs> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<AnimeCategoryTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected(category);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? ColorApp.purplelight : ColorApp.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  category,
                  style: AppTextStyles.bold(
                    fontSize: 14,
                    color: isSelected ? ColorApp.white : ColorApp.purplelight,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

