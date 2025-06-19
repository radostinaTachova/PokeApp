# 🧩 PokeApp 

This is a modular Swift application that leverages the [PokeAPI](https://pokeapi.co) to fetch and display Pokémon data.

## 🧱 Architecture

The project follows a **layered architecture** inspired by Android's Clean Architecture + MVVM. The structure separates concerns clearly and is designed with modularity and scalability in mind.

### Structure Overview

- `Data`: Shared data layer, including DTOs, API clients, and repository implementations.
- `Feature`: Each feature (e.g. Pokémon Types, Game, Home) contains:
  - `UI`: SwiftUI views and view models.
  - `Domain`: Use cases and feature-specific logic.

> This approach allows features to remain independent while sharing common data logic, enabling modularization and potential reuse.

📌 A conceptual diagram of the project structure is shown below:
![Mapa Conceptual Doodle A mano Multicolor](https://github.com/user-attachments/assets/769f7aaf-26b9-4ea9-905a-7aff570d5975)


## 📦 Dependencies & Tools

- **[Factory](https://github.com/hmlongco/Factory.git)**: Lightweight and scalable dependency injection framework.
- **SwiftData**: Used to persist data locally (e.g. to save the "Pokémon of the Day").

- ## 🚧 In Progress
