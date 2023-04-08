# Matcha

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Getting started continued:

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Install Node (DOES NOT APPLY to CSC 131)
It is recommended to go to the following link and follow the install process for nvm. Nvm is a node manager what will allow the user
to switch between various node versions. It is a more efficient way of using Node. 

Install nvm: https://github.com/nvm-sh/nvm

You don't need to clone the repo. Follow the install instructions in the read me. 

Now setup npm for the project. Make sure you are at the repo root; AKA matcha/
Run the following command:

    npm init

It may ask you some setup questions. I don't remeber what they are but use your best judgemnt to answer them.
Then run the following command to install:

    npm install

The files that are downloaded DO NOT need to be tracked in git. Make sure to add these to .gitignore or be careful to only stage necessary
files when pushing to the git repo.

### Setup Firebase CLI

To  set up the Firebase project run the following commands:

    $ npm install -g firebase-tools

To signin to firebase run the command:

    forebase login

It will open a browser for you to login.

Initiate the project with the following command:

    firebase init

Select JavaScript when prompted. Add it to the existing project. Make sure you are at the repo root when doing so. AKA: matcha/

Use the following command when you are ready to deploy the firebase setup.

    firebase deploy



