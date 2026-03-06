import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  final String path;
  final double size;
  final double borderRadius;

  const CompanyLogo({
    super.key,
    required this.path,
    this.size = 56,
    this.borderRadius = 12,
  });


  @override
  Widget build(BuildContext context) {
    final hasPath = path.trim().isNotEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: size,
        height: size,
        color: Colors.black12,
        child: hasPath
            ? Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.business,
            size: size * 0.45,
          ),
        )
            : Icon(
          Icons.business,
          size: size * 0.45,
        ),
      ),
    );
  }
}