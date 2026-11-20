import 'package:flutter/material.dart';
import '../models/language.dart';
import '../theme/voxa_theme.dart';
import '../widgets/voxa_button.dart';
import 'conversation_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final bool isHost;
  const LanguageSelectionScreen({super.key, required this.isHost});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  Language selected = Language.supported.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your language')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 12),
          const Text('What language\ndo you speak?', style: TextStyle(fontSize: 30, height: 1.1, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          const Text('VOXA will translate the other person’s speech into your language.', style: TextStyle(color: VoxaColors.muted, height: 1.5)),
          const SizedBox(height: 26),
          Expanded(
            child: ListView.separated(
              itemCount: Language.supported.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final language = Language.supported[index];
                final active = selected.code == language.code;
                return ListTile(
                  onTap: () => setState(() => selected = language),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: active ? VoxaColors.blue : VoxaColors.border)),
                  tileColor: active ? VoxaColors.blue.withValues(alpha: .09) : VoxaColors.panel,
                  title: Text(language.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                  subtitle: Text(language.nativeName, style: const TextStyle(color: VoxaColors.muted)),
                  trailing: active ? const Icon(Icons.check_circle_rounded, color: VoxaColors.blue) : null,
                );
              },
            ),
          ),
          VoxaButton(
            label: 'Continue',
            icon: Icons.arrow_forward_rounded,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ConversationScreen(myLanguage: selected, isHost: widget.isHost))),
          ),
        ]),
      ),
    );
  }
}
