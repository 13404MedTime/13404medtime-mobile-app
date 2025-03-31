import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    this.fit,
    this.backgroundColor,
    this.height = 0,
    this.width = 0,
    this.errorWidget,
    this.borderRadius,
    super.key,
  });
  final String imageUrl;
  final BoxFit? fit;
  final Color? backgroundColor;
  final double height;
  final double width;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: ColoredBox(
          color: backgroundColor ?? Colors.transparent,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            cacheKey: imageUrl,
            height: height,
            width: width,
            // memCacheHeight: 500,
            // memCacheWidth: 500,
            // cacheManager: CacheManager(
            //   Config(
            //     imageUrl,
            //     maxNrOfCacheObjects: 100,
            //   ),
            // ),

            placeholder: (_, __) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            errorWidget: (_, __, ___) => errorWidget != null
                ? errorWidget!
                : Center(
                    child: Image.asset(
                      'assets/png/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
        ),
      );
}
