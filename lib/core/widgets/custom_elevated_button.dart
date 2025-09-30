import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.image,
    this.onPressed,
    this.style,
  });

  final String text;
  final String? image;
  final ButtonStyle? style;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163.w,
      height: 60.h,
      child: image != null && image!.isNotEmpty
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Image.asset(image!, height: 20.h, width: 20.w),
              label: Text(text, style: TextStyle()),
              style: style,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: Text(text),
            ),
    );
  }
}
