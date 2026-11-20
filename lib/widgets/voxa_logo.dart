import 'package:flutter/material.dart';
import '../theme/voxa_theme.dart';

class VoxaLogo extends StatelessWidget {
  final double size;
  const VoxaLogo({super.key, this.size = 54});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * .32),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [VoxaColors.blueSoft, VoxaColors.blue],
        ),
        boxShadow: [
          BoxShadow(
            color: VoxaColors.blue.withValues(alpha: .22),
            blurRadius: 24,
            spreadRadius: 1,
          )
        ],
      ),
      child: Icon(Icons.graphic_eq_rounded, color: const Color(0xFF04111B), size: size * .62),
    );
  }
}
