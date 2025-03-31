import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    this.child,
    this.margin,
    this.padding,
    this.height = double.infinity,
    this.width = double.infinity,
    this.borderRadius = 6,
    super.key,
  });

  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFC4CAE9),
          highlightColor: const Color(0xC4CAE9FF).withOpacity(0.3),
          child: child != null
              ? Material(
                  color: const Color(0xC4CAE9FF),
                  borderOnForeground: false,
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: child,
                )
              : Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Material(
                      borderRadius: BorderRadius.circular(borderRadius),
                      shadowColor: Colors.black,
                    ),
                  ),
                ),
        ),
      );
}
