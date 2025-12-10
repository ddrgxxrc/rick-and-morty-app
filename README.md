# Rick and Morty Character Explorer

## Description
This is a Flutter mobile app that fetches characters from the Rick and Morty API.
It shows a list of characters with pagination, allows searching by name, and displays
detailed information when a character is selected.

## Features
- **Character List:** Loads characters in pages of 20 for smooth scrolling.
- **Search:** Find characters by name.
- **Details View:** See character's name, image, species, and status.
- **Error Handling:** Shows messages when something goes wrong or the list is empty.

## Technologies
- Flutter (Dart)
- Provider for state management
- http package for API requests
- Layered project structure: Models, Services, Providers, Screens

## How to Run
1. Make sure you have Flutter installed.
2. Open the project folder in your terminal or IDE.
3. Run `flutter pub get` to fetch dependencies.
4. Run `flutter run` to start the app.

## Architecture Decisions
- Layered approach separates UI from business logic and API code for easier maintenance.
- Provider helps manage app state cleanly and keeps UI and data separate.

## Assumptions / Decisions
- Pagination loads 20 characters at a time.
- Search works only on the loaded characters.
- Error messages are kept simple and user-friendly.

## API Source
- Rick and Morty API: [https://rickandmortyapi.com/documentation](https://rickandmortyapi.com/documentation)

