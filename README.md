# flutter_login_ui

To integrate Firebase with your Flutter project, you have to create a new Firebase project by going to the console.

Add a new project and give it a name. We don’t need Google Analytics for this sample project, so you can disable it. Once you’ve created your project, you’ll be directed to your Firebase project dashboard.
Set up Firebase for Firebase.
follow the below images 

Import Firebase plugins
Before you start to implement the authentication logic, you need to import the following plugins:

firebase_core, which is required to use any Firebase service in a Flutter app
firebase_auth to get access to Firebase Authentication services
Add these plugins to your pubspec.yaml file:

dependencies:
firebase_core: ^1.0.4
firebase_auth: ^1.1.1