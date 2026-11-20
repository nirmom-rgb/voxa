import 'package:flutter/material.dart';
import '../theme/voxa_theme.dart';
import '../widgets/voxa_button.dart';
import '../widgets/voxa_logo.dart';
import 'create_session_screen.dart';
import 'join_session_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 28, 26, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  VoxaLogo(),
                  SizedBox(width: 13),
                  Text('VOXA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 4)),
                ],
              ),
              const Spacer(),
              Center(
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: VoxaColors.panel,
                    border: Border.all(color: VoxaColors.border),
                    boxShadow: [BoxShadow(color: VoxaColors.blue.withValues(alpha: .10), blurRadius: 55, spreadRadius: 12)],
                  ),
                  child: const Icon(Icons.graphic_eq_rounded, size: 100, color: VoxaColors.blue),
                ),
              ),
              const SizedBox(height: 44),
              const Text('Speak without\nborders.', style: TextStyle(fontSize: 42, height: 1.08, fontWeight: FontWeight.w800, letterSpacing: -1.5)),
              const SizedBox(height: 14),
              const Text('Real conversations. Different languages.\nOne connection.', style: TextStyle(color: VoxaColors.muted, fontSize: 16, height: 1.5)),
              const SizedBox(height: 34),
              VoxaButton(
                label: 'Create a conversation',
                icon: Icons.add_rounded,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateSessionScreen())),
              ),
              const SizedBox(height: 12),
              VoxaButton(
                label: 'Join a conversation',
                icon: Icons.qr_code_scanner_rounded,
                secondary: true,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const JoinSessionScreen())),
              ),
              const SizedBox(height: 22),
              const Center(child: Text('YOUR VOICE. THEIR LANGUAGE.', style: TextStyle(color: VoxaColors.muted, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.w700))),
            ],
          ),
        ),
      ),
    );
  }
}
