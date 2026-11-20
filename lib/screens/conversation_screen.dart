import 'package:flutter/material.dart';
import '../models/language.dart';
import '../theme/voxa_theme.dart';

class ConversationScreen extends StatelessWidget {
  final Language myLanguage;
  final bool isHost;
  const ConversationScreen({super.key, required this.myLanguage, required this.isHost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Live conversation', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          Text('DEMO SESSION • NOT CONNECTED', style: TextStyle(fontSize: 9, color: VoxaColors.muted, letterSpacing: 1.2)),
        ]),
        actions: [IconButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), icon: const Icon(Icons.call_end_rounded, color: Color(0xFFFF647C)))],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 22),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            decoration: BoxDecoration(color: VoxaColors.panel, borderRadius: BorderRadius.circular(14), border: Border.all(color: VoxaColors.border)),
            child: Row(children: [
              const Icon(Icons.language_rounded, color: VoxaColors.blue),
              const SizedBox(width: 10),
              Expanded(child: Text('Your language: ${myLanguage.name}', style: const TextStyle(fontWeight: FontWeight.w600))),
              const Icon(Icons.swap_horiz_rounded, color: VoxaColors.muted),
            ]),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(children: const [
              _MessageCard(label: 'YOU • JAPANESE', original: 'こんにちは！東京へようこそ。', translated: 'Hello! Welcome to Tokyo.', isMine: true),
              SizedBox(height: 12),
              _MessageCard(label: 'OTHER PERSON • ENGLISH', original: 'Thank you! It’s my first time here.', translated: 'ありがとう！ここに来るのは初めてです。', isMine: false),
            ]),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: VoxaColors.panel, borderRadius: BorderRadius.circular(22), border: Border.all(color: VoxaColors.border)),
            child: Column(children: [
              Container(
                width: 76, height: 76,
                decoration: BoxDecoration(shape: BoxShape.circle, color: VoxaColors.blue.withValues(alpha: .14), border: Border.all(color: VoxaColors.blue.withValues(alpha: .5))),
                child: const Icon(Icons.graphic_eq_rounded, color: VoxaColors.blue, size: 38),
              ),
              const SizedBox(height: 12),
              const Text('Listening for a speaker…', style: TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 5),
              const Text('Automatic conversation mode', style: TextStyle(color: VoxaColors.muted, fontSize: 12)),
              const SizedBox(height: 14),
              const Text('Microphone and live translation are not connected yet.', textAlign: TextAlign.center, style: TextStyle(color: VoxaColors.muted, fontSize: 11)),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  final String label;
  final String original;
  final String translated;
  final bool isMine;
  const _MessageCard({required this.label, required this.original, required this.translated, required this.isMine});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isMine ? VoxaColors.blue.withValues(alpha: .08) : VoxaColors.panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: isMine ? VoxaColors.blue.withValues(alpha: .35) : VoxaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(color: VoxaColors.muted, fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Text(original, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        const Divider(color: VoxaColors.border),
        Text(translated, style: const TextStyle(color: VoxaColors.blueSoft, fontSize: 15)),
        const SizedBox(height: 8),
        const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Icon(Icons.volume_up_rounded, color: VoxaColors.muted, size: 17),
          SizedBox(width: 5),
          Text('Translated audio preview', style: TextStyle(color: VoxaColors.muted, fontSize: 10)),
        ]),
      ]),
    );
  }
}
