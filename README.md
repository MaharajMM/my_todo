# 📚 My Todo App

A simple yet powerful Todo list application built with Flutter and Riverpod.

## 🚀 Features
- Create and manage tasks with a clean, intuitive interface
- Mark tasks as completed with a simple tap
- Tasks automatically reorder based on completion status:
    - Completed tasks move to the bottom of the list
    - Uncompleted tasks move to the top of the list
- Swipe to delete tasks
- Persistent storage - your tasks remain saved between app restarts
- Material Design UI with smooth animations

## 🛠️ Tech Stack
- **Flutter** (Frontend UI)
- **Riverpod** (State management)
- **Hive** (For session management)


## 🔧 Installation & Setup
To get started, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/MaharajMM/my_todo.git
```

2. Navigate to the project directory:
```bash
cd my_todo
```
3. Install dependencies:
```bash
flutter pub get
```
4. Build the project with build_runner
```bash
dart run build_runner build --delete-conflicting-outputs
```
**Note :** Go to ```Run & Debug``` tab and select ```Launch normal```

5. Run the app:
```bash
flutter run
```

## Usage

- Adding a task: Tap the floating action button (+) in the bottom right corner
- Completing a task: Tap the checkbox next to a task
- Deleting a task: Swipe left on a task to delete it
- Uncompleting a task: Tap the checkbox again to mark it as not completed

## State Management
This app uses Riverpod for state management. The TodoNotifier class extends StateNotifier and handles all todo operations:

- Adding new todos
- Toggling completion status
- Reordering based on completion status
- Deleting todos

##Persistence
Todos are persisted locally using Hive. The TodosDbService handles:

- Loading todos from storage when the app starts
- Saving todos whenever changes are made
- Encoding/decoding todos for storage

## Customization
Feel free to customize the app by:

- Changing the color scheme in main.dart
- Adding additional fields to the Todo model
- Implementing categories or priorities for todos
- Adding due dates or reminders

- 
## 🧑‍💻 Author
Made with ❤️ by Maharaj Madan Mohan Behera

## 🖼️ UI Screen shots
<img width="334" alt="Screenshot 2025-04-10 at 1 14 49 AM" src="https://github.com/user-attachments/assets/7b6d0bfc-5b51-4bc3-938d-31bf3e3d1149" />
<img width="331" alt="Screenshot 2025-04-10 at 1 15 12 AM" src="https://github.com/user-attachments/assets/a3727179-5261-4be2-baf4-c24212189674" />
<img width="333" alt="Screenshot 2025-04-10 at 1 15 49 AM" src="https://github.com/user-attachments/assets/b004c893-ab20-4613-aad3-d2128f246e76" />
<img width="333" alt="Screenshot 2025-04-10 at 1 16 13 AM" src="https://github.com/user-attachments/assets/d2c99e36-8f47-42a2-8686-715dae5bf254" />

## Demonstrating video
https://github.com/user-attachments/assets/d2e35e4f-7bad-48c4-835c-5442a8eebdda


## 📄 License
This project is licensed under the MIT License.


