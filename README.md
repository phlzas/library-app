# 📁 Library — Book Store App

A Flutter book store client that lets users register, log in, browse books, and search the catalog by title.

## Overview

Library is a Flutter client for a book-store REST API (`librarysystemflutterteam.runasp.net`). Users create an account, sign in, and browse a catalog of books with cover images, prices, and ratings. A search screen lets users find books by title, and a details screen shows the full description.

## Features

- User registration and login with form validation (name, email, password, phone)
- Book catalog: list of books with cover image, title, price, and rating
- Book details screen with description, author, price, and rating
- Search books by title against the API
- Reusable UI components: text fields, search field, cards, snackbars
- State management with Provider (`ChangeNotifier`)

## Tech Stack

- Flutter / Dart (SDK `^3.9.2`)
- [dio](https://pub.dev/packages/dio) — HTTP client
- [provider](https://pub.dev/packages/provider) — state management
- [flutter_lints](https://pub.dev/packages/flutter_lints) `^5.0.0`

## Getting Started

### Prerequisites

- Flutter SDK (3.9.x or compatible)
- Access to the book-store backend at `librarysystemflutterteam.runasp.net`

### Run

```bash
flutter pub get
flutter run
```

## Notes

- The repository name (`libarary`) is a misspelling of "library"; see the repository report for rename recommendations.
- `lib/api.json` contains a sample API response used as a data reference during development.