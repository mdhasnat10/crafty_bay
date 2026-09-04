import 'package:crafty_bay/app/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 140, this.height = 150});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPath.logoSvg,
      width: width,
      height: height,
      fit: .scaleDown,
    );
  }
}
