# VOXA — Flutter starter

A dark, premium Flutter UI scaffold for a two-person live translation app.

## Included
- Welcome screen
- Create-session screen (local demo session code)
- Join-session screen (manual code entry UI)
- Language selection screen
- Live conversation screen (UI demo only)

## Run
1. Install Flutter: https://docs.flutter.dev/get-started/install
2. From this directory run:
   ```bash
   flutter pub get
   flutter run
   ```

## Important
This is a navigable UI prototype. Session creation is currently local/demo only.
QR scanning, real device-to-device networking, speech recognition, translation,
text-to-speech, authentication, privacy controls, and subscriptions are not yet
implemented. Do not use this prototype for real or sensitive conversations.

## Suggested next milestones
1. Add QR generation/scanning and a backend session service.
2. Add microphone permission handling and streaming speech recognition.
3. Add translation and text-to-speech services.
4. Add WebRTC/WebSocket transport, echo cancellation, turn detection, and
   reconnection handling.
5. Add account, privacy, retention, billing, accessibility, and store compliance.
