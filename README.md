# Flutter Shopping List: Quickdro

This project is a feature-rich shopping list application built to demonstrate a strong understanding of mobile development, software architecture, and the best practices required for a professional software engineering role. It is not just a functional app but a carefully engineered product designed for scalability, performance, and maintainability.

**Live Demo/Portfolio Link:** [Link to Your Deployed App or Portfolio]

## App Showcase

A quick visual overview of the application's core functionality.

| Homescreen | Add Item Screen |
| :---: | :---: |
| ![Homescreen](https://drive.google.com/uc?export=view&id=1VvgRhQe8sVEEMY9Zmi8uFw2EVaPn_2KO) | ![Add Item](https://drive.google.com/uc?export=view&id=1qOXhSWO8bFJHLjByDLDjpYWFaUPg0HTB) |
| **Fig 1.** The main screen displaying the shopping list, built with a `ListView.builder` for UI efficiency. | **Fig 2.** The screen for adding a new item, with input validation to ensure data integrity. |

| Real-Time Search | Mark as Purchased |
| :---: | :---: |
| ![Search](https://drive.google.com/uc?export=view&id=1kfjh81rhkX9XD9S4FhpawQ-Zsxzejwqd) | ![Mark as Purchased](https://drive.google.com/uc?export=view&id=1NxSgp78Luv6MLwy9HcNHFxtBXjJHqsT_) |
| **Fig 3.** The search bar provides instant, client-side filtering by updating the application's state. | **Fig 4.** An item's state is updated in the local database, with immediate visual feedback in the UI. |

## Features & Technical Implementation

- **Create and Manage Items**: Users can add items with optional prices. The UI is designed for a seamless user experience, with intuitive controls for adding and managing list items.
- **Local Data Persistence**: The app uses an **SQLite** database via the `sqflite` package to store all shopping items locally. This ensures that the user's data is persistent across app sessions.
- **State Management with Provider**: The application's state is managed using the `provider` package, following the `ChangeNotifier` pattern. This allows for a clean separation between the UI and business logic, making the app easier to scale and maintain.
- **Mark as Purchased**: Users can tap a checkbox to mark an item as purchased. This action updates the item's state in the database and provides immediate visual feedback in the UI by graying out the item.
- **Delete Items**: Items can be easily removed from the list, with the change instantly reflected in both the UI and the local database.
- **Real-Time Search**: A search bar allows users to filter the list in real-time. The filtering logic is handled efficiently on the client side by the `ItemProvider`, ensuring a fast and responsive user experience.
- **Input Validation**: The "Add Item" screen includes validation to prevent users from submitting empty items, ensuring data integrity.

## Technologies & Tools

- **[Flutter](https://flutter.dev/)**: The UI toolkit for building natively compiled applications from a single codebase.
- **[Dart](https://dart.dev/)**: The object-oriented language used for Flutter development.
- **[Provider](https://pub.dev/packages/provider)**: The library used for state management, enabling a clean, reactive architecture.
- **[sqflite](https://pub.dev/packages/sqflite)**: The plugin used for local data persistence with SQLite.
- **[path_provider](https://pub.dev/packages/path_provider)**: A plugin used to locate the correct path for the local database on the device's filesystem.

## Technical Deep Dive

This section details the engineering decisions that shaped the project.

### 1. Architecture

The project follows a clean, layered architecture to ensure a strong separation of concerns:

- **UI Layer (`screens/`, `widgets/`)**: Contains all Flutter widgets. This layer is responsible only for displaying data and capturing user input, without containing any business logic.
- **State Management Layer (`providers/`)**: The `ItemProvider` acts as the intermediary between the UI and the data layer. It holds the application's state and business logic, abstracting the data source from the UI.
- **Data Layer (`database/`, `models/`)**: The `ItemsDb` class handles all SQLite database operations (CRUD), while the `Item` class defines the data model. This layer fully encapsulates data persistence.

This architecture makes the codebase modular, testable, and easy to scale.

### 2. State Management

State is managed with `Provider` to create a reactive and efficient UI:

- **`ChangeNotifierProvider`**: Injects the `ItemProvider` into the widget tree, making state accessible throughout the app.
- **`Consumer`**: Rebuilds only the necessary widgets when the state changes, preventing costly rebuilds of the entire UI.
- **`notifyListeners()`**: Called within the `ItemProvider` after any data modification to trigger a targeted UI refresh.

### 3. Database Design

The app uses a local SQLite database with the following schema:

```sql
CREATE TABLE Items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    itemName TEXT NOT NULL,
    price INTEGER,
    isDone INTEGER NOT NULL
);
```

- **Asynchronous Operations**: All database calls are implemented as `async` methods to prevent blocking the UI thread, ensuring the app remains smooth and responsive.
- **Data Integrity**: The `NOT NULL` constraints and application-level validation ensure that the data stored in the database is always valid.

## Project Structure

The codebase is organized into logical directories for clarity and maintainability:

```
lib/
├── database/     # Database helper class for all CRUD operations
├── models/       # The data model for a shopping item
├── providers/    # State management logic using Provider
├── screens/      # UI for each screen of the app
└── widgets/      # Reusable UI components (e.g., the shopping list, search bar)
```

## Getting Started

To clone and run this project locally, please follow these steps:

1.  **Clone the repository:** `git clone https://github.com/theshuklavaibhav/Quickdrop.git`
2.  **Navigate to the project directory:** `cd shoping_list_app`
3.  **Install dependencies:** `flutter pub get`
4.  **Run the app:** `flutter run`

## Future Enhancements

This project has a solid foundation that can be extended with more advanced features:

- **Unit & Widget Testing**: Implement a comprehensive test suite to ensure code reliability and prevent regressions.
- **Cloud Sync**: Add a backend service (e.g., Firebase) to sync the shopping list across multiple devices.
- **User Authentication**: Introduce user accounts to allow different users to have their own separate shopping lists.
