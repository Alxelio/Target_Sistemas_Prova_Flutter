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