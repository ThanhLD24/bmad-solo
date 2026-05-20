# Mobile Mode for `engineer`

The `engineer` agent handles mobile when invoked with the `--mobile <platform>` flag, where platform = `ios` | `android` | `react-native` | `flutter`.

## When to enable mobile mode

- PRD-lite Out-of-Scope does NOT list "mobile"
- Architecture.md Stack table lists a mobile target

## Defaults per platform

| Platform | Stack default | Tests |
|----------|---------------|-------|
| iOS native | Swift + SwiftUI + XCTest | XCUITest for E2E |
| Android native | Kotlin + Compose + JUnit | Espresso for E2E |
| React Native | Expo + RN + Jest | Detox for E2E |
| Flutter | Dart + flutter_test | flutter integration_test |

## Differences from web

- Offline-first by default — assume flaky network
- Push notifications need infra setup before story can ship
- App-store review = soft gate; allow 7-day buffer in roadmap
