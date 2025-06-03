import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'custom_shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  /// [Url] for network image as nullable [String]
  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final double? clipRadius;
  final double? shimmerHeight;
  final double? shimmerWidth;
  final double? shimmerRadius;
  final Widget? errorWidget;
  final double? errorIconSize;
  final IconData? errorIcon;
  final Color? errorIconColor;
  final BorderRadius? borderRadius;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.height,
    this.width,
    this.clipRadius,
    this.shimmerHeight,
    this.shimmerWidth,
    this.shimmerRadius,
    this.errorWidget,
    this.errorIconSize,
    this.errorIcon,
    this.errorIconColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = clipRadius ??
        (width != null ? width! * 0.06 : null) ??
        (height != null ? height! * 0.08 : null) ??
        12.0;
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: (imageUrl.isNotEmpty) ? imageUrl : "No_image_given",
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) {
          return CustomShimmer(
            height: shimmerHeight ??
                height ??
                (width != null ? width! * 2 / 3 : null),
            width: shimmerWidth ??
                width ??
                (height != null ? height! * 3 / 2 : null),
            borderRadius: shimmerRadius ?? radius,
          );
        },
        errorWidget: (context, url, error) {
          return Center(
            child: errorWidget ??
                Icon(
                  errorIcon ?? Icons.broken_image,
                  size: errorIconSize,
                  color:
                      errorIconColor ?? Theme.of(context).colorScheme.outline,
                ),
          );
        },
      ),
    );
  }
}
