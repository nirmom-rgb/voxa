import 'package:flutter/material.dart';
import '../theme/voxa_theme.dart';
import '../widgets/voxa_button.dart';
import 'language_selection_screen.dart';

class JoinSessionScreen extends StatefulWidget {
  const JoinSessionScreen({super.key});

  @override
  State<JoinSessionScreen> createState() => _JoinSessionScreenState();
}

class _JoinSessionScreenState extends State<JoinSessionScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Join conversation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          const Icon(Icons.qr_code_2_rounded, color: VoxaColors.blue, size: 48),
          const SizedBox(height: 24),
          const Text('You’re invited.', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          const Text('Enter the connection code shared by the other person.', style: TextStyle(color: VoxaColors.muted, height: 1.5)),
          const SizedBox(height: 30),
          TextField(
            controller: controller,
            maxLength: 6,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 26, letterSpacing: 9, fontWeight: FontWeight.w800),
            decoration: const InputDecoration(hintText: '000000', counterText: ''),
          ),
          const SizedBox(height: 18),
          VoxaButton(
            label: 'Continue',
            icon: Icons.arrow_forward_rounded,
            onPressed: () {
              if (controller.text.trim().length != 6) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter a six-digit demo code.')));
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageSelectionScreen(isHost: false)));
            },
          ),
          const SizedBox(height: 14),
          const Text('Demo only: codes are not yet checked against another device.', style: TextStyle(color: VoxaColors.muted, fontSize: 11)),
        ]),
      ),
    );
  }
}
