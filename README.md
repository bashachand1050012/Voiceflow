# Voiceflow

Voiceflow is a cross-platform conversational intelligence CRM built with Flutter.

## Supported platforms

- Flutter Web
- Android
- iOS

## Technology

- Flutter + Dart
- Material 3 foundation with a custom CRM design system
- Riverpod for application state
- GoRouter for navigation

## Prerequisites

Install the current stable Flutter SDK and the platform toolchains you intend to build for:

- Web: Chrome (for local debugging)
- Android: Android Studio and Android SDK
- iOS: macOS with Xcode and CocoaPods

Check your environment:

```bash
flutter doctor
```

## Bootstrap platform projects

This repository contains the shared Flutter application source. Generate the native runner projects for all targets from the repository root:

```bash
flutter create --platforms=web,android,ios --org com.voiceflow .
```

Then install dependencies and run:

```bash
flutter pub get
flutter run -d chrome
```

Android:

```bash
flutter run -d android
```

iOS (on macOS):

```bash
flutter run -d ios
```

Build release artifacts:

```bash
flutter build web
flutter build appbundle
flutter build ipa
```

## Project structure

```
lib/
  app/                  # App composition, router and theme
  core/                 # Shared application shell and primitives
  features/
    dashboard/          # CRM overview feature
```

Feature modules should own their presentation, state and data layers as they are added. Keep platform-specific behavior behind small adapters and keep business logic shared across platforms.

## Design principles

- Desktop-first information density for CRM workflows, with adaptive tablet and mobile navigation.
- Material 3 is the foundation, not the finished visual language.
- Shared design tokens and reusable components live in the app theme and core layer.
- Use real domain models and API-backed data when integrations are introduced. The current dashboard uses clearly illustrative sample content.

## Current scope

This is the initial Flutter CRM foundation. Authentication, backend services, contacts, call intelligence, inbox, reporting and AI insight workflows are not connected yet.
