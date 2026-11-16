# Flutter User Management Dashboard

A simple and interactive Flutter application that provides a dashboard to manage user information. Users can add their personal details through a registration form and view the submitted information in a user list.

## Features

- **Dashboard:** Attractive dashboard with a purple gradient design.
- **Add User:** Registration form to enter user details.
- **Form Validation:** Validates name, phone number, birthdate, gender and email.
- **Automatic Age Calculation:** Calculates age based on the selected birthdate.
- **Reset Form:** Clears all entered information.
- **User List:** Displays submitted user information.
- **Navigation:** Easy navigation between dashboard, registration form and user list.

## User Information Fields

- Name
- Phone Number
- Birthdate
- Age
- Gender
- Email

## Technologies Used

- Flutter
- Dart
- Android Studio
- Material Design

## Project Structure

```text
lib/
│
├── main.dart
├── dashboard_screen.dart
├── form_screen.dart
└── userlist.dart
```

## How to Run the Project

1. Clone this repository:

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

2. Open the project folder:

```bash
cd YOUR_PROJECT_NAME
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Application Screens

1. Dashboard Screen
2. User Registration Form
3. User List Screen

## Note

This project currently uses in-memory storage for user information. User records are not permanently saved and will be lost when the application restarts.

## Author

**Hardi Bhimani**

## License

This project is created for educational purposes.
