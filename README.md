# 📝 Nawetly - Notes App

**Nawetly** is a clean, fast, and lightweight mobile app for taking and managing notes. Designed with simplicity and elegance in mind, Nawetly helps users capture ideas, tasks, and reminders anytime, anywhere.

## 📱 Features

- 📝 Add, edit, and delete notes
- 🔍 Search and filter through your notes
- 🗃️ Notes are stored using Hive (local database)
- ⚡ Fast and smooth performance
- 🌙 Clean and minimal UI with dark mode support
- 🧠 Built with Bloc for scalable and maintainable state management

## 🛠️ Built With

- **Flutter** – UI toolkit for building natively compiled apps
- **Hive** – Lightweight key-value database for Flutter
- **Bloc** – Predictable state management
- **Dart** – Programming language for Flutter

## 📂 Project Structure

lib/
├── cubits/                      # Cubit logic (notes_cubit and states)
│   ├── notes_cubit.dart
│   └── notes_states.dart
│
├── models/                      # Note model and Hive adapter
│   ├── note_model.dart
│   └── note_model.g.dart
│
├── pages/                       # Screens/pages
│   ├── add_note_page.dart
│   ├── edit_note_page.dart
│   └── notes_page_view.dart
│
├── widgets/                     # Reusable UI components
│   ├── add_note_app_bar.dart
│   ├── add_note_button.dart
│   ├── add_note_page_app_bar.dart
│   ├── app_bar_icon.dart
│   ├── color_item.dart
│   ├── colors_list_view.dart
│   ├── connect_with_me.dart
│   ├── no_notes_yet.dart
│   ├── note_card.dart
│   ├── notes_list_view.dart
│   ├── notes_page_app_bar.dart
│   └── text_form_field.dart
│
├── constants.dart               # App constants
└── main.dart                    # App entry point

