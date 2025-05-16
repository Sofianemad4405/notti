# 📝 Nawetly - Notes App

**Nawetly** is a clean and minimal notes app built with Flutter. It allows users to create, edit, and manage notes with a focus on speed and simplicity. Whether it's a quick thought, a task, or a reminder — Nawetly helps you keep it all in one place.

---

## 🚀 Features

- 📝 Create, edit, and delete notes
- 🎨 Choose a color for each note
- 📦 Local storage using Hive database
- 🧠 Simple and predictable state management using Cubit
- 🌓 Light and dark mode compatibility
- 💡 Friendly, intuitive, and responsive UI

---

## 🛠️ Built With

- **Flutter** – Cross-platform UI toolkit
- **Hive** – Lightweight NoSQL database for local storage
- **Cubit (from Bloc)** – State management
- **Dart** – Main programming language

---

## 📁 Project Structure

```plaintext
lib/
├── cubits/                      # Cubit logic (state management)
│   ├── notes_cubit.dart
│   └── notes_states.dart
│
├── models/                      # Note model and Hive adapter
│   ├── note_model.dart
│   └── note_model.g.dart
│
├── pages/                       # Screens
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
├── constants.dart               # App constants (colors, keys, etc.)
└── main.dart                    # Entry point of the application
