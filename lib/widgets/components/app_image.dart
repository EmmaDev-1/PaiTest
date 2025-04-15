import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final String? placeholderPath;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final double? width;
  final double? height;

  const AppImage({
    required this.imageUrl,
    super.key,
    this.placeholderPath,
    this.borderRadius,
    this.fit = BoxFit.cover,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(0)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
        placeholder:
            (context, url) => Image.asset(
              placeholderPath ?? '',
              fit: fit,
              width: width,
              height: height,
            ),
        errorWidget:
            (context, url, error) =>
                Image.asset('', fit: fit, width: width, height: height),
      ),
    );
  }
}
