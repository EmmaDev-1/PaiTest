// app_image.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;

  final bool isAsset;

  final String? placeholderPath;

  final BorderRadius? borderRadius;

  final BoxFit fit;

  final double? width;

  final double? height;

  const AppImage({
    Key? key,
    required this.imageUrl,
    this.isAsset = false,
    this.placeholderPath,
    this.borderRadius,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius _radius = borderRadius ?? BorderRadius.zero;

    if (isAsset || !_looksLikeNetworkUrl(imageUrl)) {
      return ClipRRect(
        borderRadius: _radius,
        child: Image.asset(imageUrl, width: width, height: height, fit: fit),
      );
    }

    return ClipRRect(
      borderRadius: _radius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) {
          if (placeholderPath != null && placeholderPath!.isNotEmpty) {
            return Image.asset(
              placeholderPath!,
              width: width,
              height: height,
              fit: fit,
            );
          }
          // o un Container vacío
          return const SizedBox.shrink();
        },
        errorWidget: (context, url, error) {
          if (placeholderPath != null && placeholderPath!.isNotEmpty) {
            return Image.asset(
              placeholderPath!,
              width: width,
              height: height,
              fit: fit,
            );
          }
          return Center(
            child: Icon(
              Icons.broken_image,
              size:
                  (width != null && height != null)
                      ? (width! < height! ? width! : height!) / 2
                      : 24,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }

  bool _looksLikeNetworkUrl(String src) =>
      src.startsWith('http://') || src.startsWith('https://');
}
