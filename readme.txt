PROJECT: Rick and Morty Character Explorer
==========================================

DESCRIPTION:
A mobile application built with Flutter that fetches and displays characters
from the Rick and Morty API. It demonstrates clean architecture, pagination,
search functionality, and modern state management.

FEATURES:
- Character List: Loads characters in chunks of 20 (Infinite Scrolling).
- Search: Filter characters by name.
- Details View: Display character status, species, and image.
- Error Handling: Manages network errors and empty states.

TECHNOLOGIES:
- Framework: Flutter (Dart)
- State Management: Provider
- Networking: http package
- Architecture: Layered (Models, Services, Providers, Screens)

HOW TO RUN:
1. Make sure Flutter SDK is installed.
2. Open the project folder in your terminal.
3. Run "flutter pub get" to install dependencies.
4. Run "flutter run" to launch the app.

ARCHITECTURE DECISIONS:
- Layered Architecture: Used to separate the UI code from the business logic
  and data fetching, making the app easier to maintain and test.
- Provider: Chosen for efficient state management and to decouple the
  UI from the data layer.