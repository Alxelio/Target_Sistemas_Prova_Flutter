# Target_Sistemas_Prova_Flutter
I had applied for a job at Target Sistemas Company and then I was requested to do some Flutter applications. Therefore I could be evaluated about my hard skills and so on.

# First of all, I created my Flutter project for some application platforms, like android, ios and web, and also having my signature with this command below.
flutter create --project-name projeto_flutter_target_sistemas --platforms android,ios,web --org br.com.estevesalxelio ./Target_Sistemas_Prova_Flutter

# BoxDecoration - LinearGradient

## I cleaned up all the default code and made a new main function. This main runs a runApp function and into it there is a MaterialApp widget.
## The MaterialApp widget calls the LoginPage class.
## Inside the LoginPage class there are a SafeArea and a Scaffold widgets.
## I declared a container widget in the body and inside it there is a boxdecoration for linear gradient. 

# Text - TextFormField - InputDecoration - OutlineInputBorder - TextButton - ButtonStyle - RoundedRectangleBorder - BorderRadius - Icon 

## I started to plan the login page placing a Column, and inside this a Form with Text followed by TextFormField. After doing that, I repeated the process once again. Under this TextFormField I put an TextButton and finally a last Text at the bottom page.
## I made some customizations on its widgets to improve their appearance such as space between then with SizedBox, or using InputDecoration and ButtonStyle.

# RegExp(r'^[a-zA-Z0-9]+$') 

## Implementing some functionalities for login and password. I made a validation for password field about special characters.

# User Field - Empty Values

## I changed the name of loginPressedSenha function to loginPressed. I also changed the name of alertSenhaEspecial function to alertSpecialPassword.
## I made a check about User field. This field is not allowed to accept an empty value.

# Password Field - Empty Values

## I made a check about Password field. This field is not allowed to accep an empty value. 
## This validation for empty values is one by one, and its direction is top-down, not both of them at the same time.

# Password Field - Length of Input

## This validation is done for checking the length of input for password field. It is not allowed to get the length less than 2 characters and more than 20 characters at the same time.

# User Field - Length of Input

## This validation is done for checking the length of input for user field. It is not allowed to get the length more than 20 characters.

# Empty Spaces - User field

## I made a validation about ending with empty spaces in the User field.

# Empty Spaces - Password field

## I made a validation about ending with empty spaces in the Password field.

# New Page - Mock API Validation

## I added a Mock API Validation for user and password - I assigned "Target" for user field and "Sistemas" for password to navigate to the new page. 

# Launcher  - Android Manifest.xml - Google website

## I improved our version for compileSdkVersion 33 command and the path for reach this is: android/app/build.gradle
## I needed to change some permissions on Android Manifest. The path for reach this is: android/app/src/main/AndroidManifest.xml
## The command is:  <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" /> 
## I should type this command above inside the Tag <manifest xmlns:android="http://schemas.android.com/apk/res/android" ... /> at any place.
## At pubspec.yaml I needed to place this command at - dependencies: url_launcher: ^6.1.8

# Refactoring the code

## I changed all the calling Dialog and Alert functions to have only one, because I intended to avoid the repetitions. 
## So I introduced a specific String parameter in every calling functions to solve it.

# DDD Domain-Driven Design Principles - Componentization 

## I did my best to reach Domain-Driven Design Principles, with that said, I think it is like people and books usually say: "Understanding is a piece of a cake but doing, it is a hard task".

# Tests for Validation

## I used the default test packages for Flutter in the pubspec.yaml file
## dev_dependencies:
##   flutter_test: 
##   sdk:flutter
## I had some difficulties about the BuildContext context parameter which I used to pass previously in this code, because in tests we do not usually use the current context in tests, but our inputs as we own wish.
## So I had to be careful about '?' operator to assign the variable which can be optional and '!' operator to assign to the context that really exists like in Navigator.push(context!).
## After that I started to approach some application tests and I had to change the scope and the signature of function.
## When I was doing theses tests, I tried to apply the TDD and SOLID Principles as much as I could. 

