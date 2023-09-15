import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/widgets/alert.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/card.dart';
import 'package:flutter_boilerplate/widgets/custom_button.dart';
import 'package:flutter_boilerplate/widgets/dropdown.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boilerplate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all, //add your languages inside L10n class
      home: const MyHomePage(title: 'Flutter Boilerplate Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context)!.flutterBoilerplate),
        showActionButton: true,
        iconName: Icons.language,
        actionButtonColor: Colors.black,
        onClick: () {},
        bgColor: Colors.amber[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              btnLabel: "Custom btn",
              onClick: () {},
              buttonWidth: screenWidth * 0.8,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 20,
              ),
              borderStyle: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.dark),
            ),
            // Alert(
            //   title: "This is an alert",
            //   onAccept: () {},
            //   onDeny: () {},
            //   message: "this is an custom alert widget.",
            // ),
            // AppCard(
            //   color: AppColors.gray,
            //   body: Column(
            //     children: [
            //       const Text("This is an card body"),
            //       CustomButton(
            //         btnLabel: "submit",
            //         onClick: () {
            //           Navigator.of(context).pop();
            //         },
            //         buttonWidth: screenWidth * 0.2,
            //         buttonHeight: screenHeight * 0.04,
            //         style: const TextStyle(
            //           color: AppColors.dark,
            //           backgroundColor: AppColors.light,
            //           fontSize: 16,
            //         ),
            //         borderStyle: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15.0),
            //             color: AppColors.dark),
            //       ),
            //     ],
            //   ),
            //   borderRadius: 30.0,
            //   elevation: 10,
            //   padding: 20,
            // ),
            DropDown(
              items: const [
                "English",
                "Germen",
                "Spanish",
              ],
              onChanged: (val) => {print("selected val = $val")},
              labelText: "Choose language",
              filled: true,
              fillColor: AppColors.gray3,
              borderRadius: 20,
            )
          ],
        ),
      ),
    );
  }
}
