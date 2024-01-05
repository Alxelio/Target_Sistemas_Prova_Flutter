import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_flutter_target_sistemas/services/validation_services.dart';

void main() {
  group('It should return an error message', () {
    testWidgets(
        'It should return an error message if it has empty spaces at the end of user field!',
      (WidgetTester tester) async {
      TextEditingController userController =
          TextEditingController(text: 'Target ');
      TextEditingController passwordController =
          TextEditingController(text: 'Sistemas ');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return SizedBox();
            },
          ),
        ),
      );

      BuildContext testContext = tester.element(
        find.byType(SizedBox),
      );

      await tester.runAsync(() async {
        userFieldEndsEmpty(testContext, userController, passwordController);
        await tester.pump();
        await tester.pump(
          const Duration(seconds: 3),
        );
      });

      expect(
        userController.text,
        equals('Target '),
      );
    });


    testWidgets(
        'It should return an error message if it has empty spaces at the end of password field!',
      (WidgetTester tester) async {
      TextEditingController userController = TextEditingController(text: 'Target ');
      TextEditingController passwordController = TextEditingController(text: 'Sistemas ');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
              builder: (BuildContext context) {
                return SizedBox();
              }
          ),
        ),
      );

      BuildContext testContext = tester.element(
        find.byType(SizedBox),
      );

      await tester.runAsync(() async {
        passwordFieldEndsEmpty(testContext, userController, passwordController);
        await tester.pump();
        await tester.pump(
          const Duration(seconds: 3),
        );
      });

      expect(
        passwordController.text,
        equals('Sistemas '),
      );
    });


    testWidgets(
        'It should return an error message if there is no charactere at user field!',
      (WidgetTester tester) async {
      TextEditingController userController = TextEditingController(text: '');
      TextEditingController passwordController = TextEditingController(text: '');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context){
              return SizedBox();
            },
          ),
        ),
      );

      BuildContext testContext = tester.element(
        find.byType(SizedBox),
      );

      await tester.runAsync(() async {
        userFieldIsEmpty(testContext, userController, passwordController,);
        await tester.pump();
        await tester.pump(
          const Duration(seconds: 3),
        );
      });

      expect(
        userController.text,
        equals(''),);
    });


    testWidgets(
        'It should return an error message if there is no charactere at password field!',
        (WidgetTester tester) async {
        TextEditingController userController = TextEditingController(text: '');
        TextEditingController passwordController = TextEditingController(text: '');

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (BuildContext context) {
                return SizedBox();
              }
            ),
          ),
        );

        BuildContext testContext = tester.element(
        find.byType(SizedBox),
      );

       await tester.runAsync(() async {
         passwordFieldIsEmpty(testContext, userController, passwordController);
         await tester.pump();
         await tester.pump(
           const Duration(seconds: 3),
         );
       });

        expect(
          passwordController.text,
          equals(''),);
      });

    testWidgets(
        'It should return an error message if the password length is less than 2 or greater than 20 characteres!',
        (WidgetTester tester) async {
        TextEditingController userController = TextEditingController(text: 'Target');
        TextEditingController passwordController = TextEditingController(text: 'S');

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (BuildContext context){
                return SizedBox();
              },
            ),
          ),
        );

      BuildContext testContext = tester.element(
        find.byType(SizedBox),
      );

      await tester.runAsync(() async {
        passwordNumberCharacteres(testContext, userController, passwordController,);
        await tester.pump();
        await tester.pump(
          Duration(seconds: 3),
        );
      });

      expect(
          passwordController.text,
          equals('S'),);
    });

    testWidgets(
        'It should return an error message if the password length is less than 2 or greater than 20 characteres!',
            (WidgetTester tester) async {
            TextEditingController userController = TextEditingController(text: 'Target');
            TextEditingController passwordController = TextEditingController(text: 'SistemasSistemasSistemas');

            await tester.pumpWidget(
              MaterialApp(
                home: Builder(
                  builder: (BuildContext context){
                    return SizedBox();
                  },
                ),
              ),
            );

            BuildContext testContext = tester.element(
              find.byType(SizedBox),
            );

            await tester.runAsync(() async {
              passwordNumberCharacteres(testContext, userController, passwordController);
              await tester.pump();
              await tester.pump(
                const Duration(seconds: 3),
              );
            });

            expect(
              passwordController.text,
              equals('SistemasSistemasSistemas'),);
            });

    testWidgets(
        'It should return an error message if the user length is greater than 20 characteres!',
        (WidgetTester tester) async {
        TextEditingController userController = TextEditingController(text: 'TargetTargetTargetTarget');
        TextEditingController passwordController = TextEditingController(text: 'Sistemas');

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (BuildContext context){
                return SizedBox();
              },
            ),
          ),
        );

        BuildContext testContext = tester.element(
          find.byType(SizedBox),
        );

        await tester.runAsync(() async {
          userNumberCharacteres(testContext, userController, passwordController,);
          await tester.pump();
          await tester.pump(
            const Duration(seconds: 3),
          );
        });

      expect(
          userController.text,
          equals('TargetTargetTargetTarget'),);
    });


    testWidgets(
        'It should return an error message if there is any special character in the password field!',
        (WidgetTester tester2) async {
         TextEditingController userController = TextEditingController(text: 'Target');
         TextEditingController passwordController = TextEditingController(text: 'Sistemas*');

         await tester2.pumpWidget(
           MaterialApp(
             home: Builder(
                 builder: (BuildContext context){
                   return Container();
                 }),
           ),
         );

         BuildContext testContext2 = tester2.element(
           find.byType(Container),
         );

         await tester2.runAsync(() async {
           passwordSpecialCharacteres(testContext2, userController, passwordController,);
           await tester2.pump();
           await tester2.pump(
             const Duration(seconds: 3),
           );
         });

         expect(
          passwordController.text,
          equals('Sistemas*'));
    });

  });
}


