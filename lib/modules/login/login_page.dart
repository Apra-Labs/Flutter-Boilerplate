import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/loading_utils.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/utils/shared_preferences_utils.dart';
import 'package:flutter_boilerplate/widgets/checkbox.dart';
import 'package:flutter_boilerplate/widgets/button.dart';
import 'package:flutter_boilerplate/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/text_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../routes/route.dart' as route;

final emailProvider = StateProvider<String>((_) => '');

///object
final passwordProvider = StateProvider<String>((_) => '');

// final widgetState = StateProvider<Object>((_) => {
//   email: '',
// });

// 1. extend [ConsumerStatefulWidget]
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPage();
}

// 2. extend [ConsumerState]
class _LoginPage extends ConsumerState<LoginPage> {
  //cleanup- lifecycle
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool showLanguageDropdown = false;
  bool showErrorMsg = false;

  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final email = ref.read(emailProvider);
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context).flutterBoilerplate),
        showActionButton: true,
        iconName: Icons.language,
        actionButtonColor: AppColors.dark,
        onClick: () {},
        bgColor: AppColors.warning,
      ),
      body: Container(
          padding:
              const EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).login,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: FontSize.extralarge,
                      fontWeight: FontWeight.w500),
                ),
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
                    style: const TextStyle(
                        color: AppColors.danger, fontSize: FontSize.medium),
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
                  buttonWidth: screenWidth * 0.4,
                  buttonHeight: screenHeight * 0.01,
                  style: const TextStyle(
                      color: AppColors.gray,
                      fontSize: FontSize.miniheader,
                      backgroundColor: AppColors.blue),
                  borderStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.blue),
                ),
              ])),
    );
  }
}
