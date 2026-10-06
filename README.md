# Meal Recipes App 🍳

A modern Flutter application for discovering, searching, and preparing delicious meal recipes from around the world. Built using Clean Architecture and responsive UI design.

---

## Features ✨

- **Explore Meals:** Browse recipes across various categories and culinary traditions.
- **Recipe Details:** Step-by-step instructions, complete ingredient lists, and measurement details.
- **Search & Filter:** Search recipes by name or filter by main ingredients and categories.
- **Favorites:** Save your favorite recipes locally for quick access.
- **Clean Architecture:** Built with separation of concerns for maintainability and testing.

---

## Tech Stack & Architecture 🛠️

- **Framework:** [Flutter](https://flutter.dev) (Dart)
- **Architecture:** Clean Architecture (Data, Domain, Presentation layers)
- **State Management:** Flutter Bloc / Cubit
- **Dependency Injection:** `GetIt`
- **Value Equality:** `Equatable`
- **Networking:** REST API (`http` / `dio`)

---

## Project Structure 📁

```text
lib/
 ├── core/              # Network clients, utilities, theme, common widgets
 └── features/
     └── meals/
         ├── data/      # Models, datasources, and repository implementations
         ├── domain/    # Entities, repository interfaces, and use cases
         └── presentation/ # Blocs/Cubits, pages, and UI widgets
         