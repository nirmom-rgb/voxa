import 'package:flutter/material.dart';
import '../theme/voxa_theme.dart';

class VoxaButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool secondary;

  const VoxaButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.secondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        style: FilledButton.styleFrom(
          backgroundColor: secondary ? VoxaColors.panelLight : VoxaColors.blue,
          foregroundColor: secondary ? Colors.white : const Color(0xFF04111B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          side: secondary ? const BorderSide(color: VoxaColors.border) : BorderSide.none,
        ),
      ),
    );
  }
}
