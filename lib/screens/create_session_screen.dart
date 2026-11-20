import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/voxa_theme.dart';
import '../widgets/voxa_button.dart';
import 'language_selection_screen.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  String code = '';

  void createDemoSession() {
    final random = Random();
    setState(() => code = List.generate(6, (_) => random.nextInt(10)).join());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create conversation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
            const Icon(Icons.wifi_tethering_rounded, color: VoxaColors.blue, size: 48),
            const SizedBox(height: 24),
            const Text('Start a connection', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            const Text('Create a private conversation and invite the other person to join.', style: TextStyle(color: VoxaColors.muted, height: 1.5, fontSize: 15)),
            const Spacer(),
            if (code.isNotEmpty) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: VoxaColors.panel, borderRadius: BorderRadius.circular(22), border: Border.all(color: VoxaColors.border)),
                child: Column(children: [
                  const Text('DEMO CONNECTION CODE', style: TextStyle(color: VoxaColors.muted, fontSize: 11, letterSpacing: 1.5)),
                  const SizedBox(height: 12),
                  Text(code, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: 8, color: VoxaColors.blue)),
                  const SizedBox(height: 8),
                  const Text('This code is generated locally for the UI demo.', textAlign: TextAlign.center, style: TextStyle(color: VoxaColors.muted, fontSize: 11)),
                ]),
              ),
              const SizedBox(height: 18),
            ],
            VoxaButton(
              label: code.isEmpty ? 'Create demo session' : 'Choose my language',
              icon: code.isEmpty ? Icons.add_link_rounded : Icons.arrow_forward_rounded,
              onPressed: () {
                if (code.isEmpty) {
                  createDemoSession();
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageSelectionScreen(isHost: true)));
                }
              },
            ),
            const SizedBox(height: 12),
            const Center(child: Text('Real QR pairing and secure sessions are coming next.', style: TextStyle(color: VoxaColors.muted, fontSize: 11))),
          ],
        ),
      ),
    );
  }
}
