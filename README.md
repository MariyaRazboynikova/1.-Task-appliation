# Task Application

## Overview

The **Task Application** is a Flutter-based mobile app designed to help users manage their tasks. It features a user-friendly interface that allows users to add, edit, delete, and toggle the completion status of tasks. The application supports both light and dark themes.

## Features

- **Task Management**: Users can create, edit, delete, and toggle the completion status of tasks.
- **Theming**: The app supports light and dark modes, allowing users to switch between themes seamlessly.
- **Persistent Storage**: Utilizes Hive for local storage of tasks, ensuring data persistence.


## Architecture
The application is structured using Clean Architecture principles and includes the following
key components:

### Theme Management
The app uses `ThemeData` to define light and dark themes.

### Task Management
The core functionality revolves around managing tasks through a model class `TaskModel` and its Hive implementation `TaskHiveModel`.

### State Management
The application implements the BLoC (Business Logic Component) pattern using `Cubit` for managing the task state.

## Usage
- Upon launching the app, users are greeted with an introductory page.
- Users can navigate to the task management page by clicking on "My Tasks".
- Tasks can be added by clicking the floating action button and entering a task name.
- Users can edit an existing task's name by tapping on it and entering a new name in the dialog.
- Tasks can be toggled as completed or deleted by using respective buttons.
