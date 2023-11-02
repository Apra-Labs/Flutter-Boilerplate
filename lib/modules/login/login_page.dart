import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';
import 'package:flutter_boilerplate/providers/providers.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/loading_utils.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/utils/shared_preferences_utils.dart';
import 'package:flutter_boilerplate/widgets/checkbox.dart';
import 'package:flutter_boilerplate/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/text_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../routes/route.dart' as route;

// 1. extend [ConsumerStatefulWidget]
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPage();
}

// 2. extend [ConsumerState]
class _LoginPage extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool showLanguageDropdown = false;
  bool showErrorMsg = false;

  @override
  void initState() {
    final email = ref.read(emailProvider);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onLogin() async {
    LoadingUtils(context).startLoading();
    await Future.delayed(const Duration(seconds: 5));
    LoadingUtils(context).stopLoading();
    final email = ref.read(emailProvider);
    for (String item in LoginCredentials.emailList) {
      if (item == email) {
        setState(() {
          showErrorMsg = false;
        });
        storeLoggedInStatus(true);
        RouteUtils.setRootPage(context, route.profilePage);
      } else {
        setState(() {
          showErrorMsg = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: setText(AppLocalizations.of(context).flutterBoilerplate),
        showActionButton: true,
        iconName: Icons.language,
        onClick: () {
          ref.read(appThemeProvider.notifier).state =
              !ref.read(appThemeProvider.notifier).state;
        },
      ),
      body: Container(
          padding:
              const EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppLocalizations.of(context).login,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                  controller: emailController,
                  labelText: AppLocalizations.of(context).email,
                  hintText: AppLocalizations.of(context).enterYourEmail,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) =>
                      {ref.read(emailProvider.notifier).update((state) => val)},
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text(email),
                TextInput(
                  controller: passwordController,
                  labelText: AppLocalizations.of(context).password,
                  hintText: AppLocalizations.of(context).enterYourPassword,
                  icon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !isChecked,
                  onChanged: (value) => {
                    ref.read(passwordProvider.notifier).update((state) => value)
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                if (showErrorMsg)
                  Text(
                    AppLocalizations.of(context).invalidEmailOrPassword,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColorsPalette.danger),
                  ),
                CheckboxButton(
                  value: isChecked,
                  label: AppLocalizations.of(context).showPassword,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  btnLabel: AppLocalizations.of(context).login,
                  onClick: () async {
                    onLogin();
                  },
                  borderStyle: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ])),
    );
  }
}
