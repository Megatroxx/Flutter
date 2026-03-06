import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderRadius;

  const CompanyLogo({
    super.key,
    required this.imageUrl,
    this.size = 56,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: size,
        height: size,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, progress) =>
          const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.black12,
            child: Icon(
              Icons.business,
              size: size * 0.45,
            ),
          ),
        ),
      ),
    );
  }
}