import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/alert_variants.dart';
import 'package:flutter_boilerplate/color_schemes.dart';
import 'package:flutter_boilerplate/modules/login/login_page.dart';
import 'package:flutter_boilerplate/modules/profile/profile_page.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/button_variants.dart';
import 'package:flutter_boilerplate/widgets/alert.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/bottom_bar.dart';
import 'package:flutter_boilerplate/widgets/card.dart';
import 'package:flutter_boilerplate/widgets/checkbox.dart';
import 'package:flutter_boilerplate/widgets/spinner.dart';
import 'package:flutter_boilerplate/widgets/button.dart';
import 'package:flutter_boilerplate/widgets/date_picker.dart';
import 'package:flutter_boilerplate/widgets/dropdown.dart';
import 'package:flutter_boilerplate/widgets/loading_widget.dart';
import 'package:flutter_boilerplate/widgets/radio_button.dart';
import 'package:flutter_boilerplate/widgets/text_input.dart';
import 'package:flutter_boilerplate/widgets/time_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../routes/route.dart' as route;

enum Gender { male, female, other }

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  Gender selectedGender = Gender.male;
  bool isChecked = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(emailProvider);
    final name = ref.watch(nameProvider);
    final AppColors appColors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: setText("UI Kit"),
        showActionButton: true,
        iconName: Icons.language,
        onClick: () {},
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text("Welcome $name",
                style: Theme.of(context).textTheme.headlineMedium
                //  TextStyle(
                //     fontSize: FontSize.extralarge, color: appColors.dark),
                ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              btnLabel: "Custom btn",
              onClick: () {},
              variant: ButtonVariant.outlineDanger,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: CustomButton(
                btnLabel: "Custom btn2",
                onClick: () {},
                variant: ButtonVariant.success,
              ),
            ),
            Alert(
              title: "This is an alert",
              onAccept: () {},
              onDeny: () {},
              message: "this is a custom alert widget.",
              variant: Variant.danger,
            ),
            AppCard(
              variant: Variant.warning,
              body: Column(
                children: [
                  const Text("This is an card body"),
                  CustomButton(
                    btnLabel: "submit",
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                    variant: ButtonVariant.outlineDark,
                    borderStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
              borderRadius: 30.0,
              elevation: 10,
              padding: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            DropDown(
              items: const [
                "English",
                "German",
                "Spanish",
              ],
              onChanged: (val) => {print("selected val = $val")},
              labelText: "Choose language",
              filled: true,
              fillColor: appColors.gray3,
              borderRadius: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(email),
            TextInput(
              controller: _emailController,
              labelText: "Email",
              hintText: "Enter your email",
              // icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              // onChanged: (val) =>
              //     {ref.read(emailProvider.notifier).state = val},
            ),
            const SizedBox(
              height: 20,
            ),
            RadioButton<Gender>(
              value: Gender.male,
              variant: Variant.warning,
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              label: 'Male',
            ),
            RadioButton<Gender>(
              value: Gender.female,
              variant: Variant.success,
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              label: 'Female',
            ),
            RadioButton<Gender>(
              value: Gender.other,
              variant: Variant.danger,
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              label: 'Other',
            ),
            const LoadingProgressBar(),
            const SizedBox(
              height: 20,
            ),
            const CircularProgress(
                // variant: Variant.warning,
                ),
            const SizedBox(
              height: 20,
            ),
            CheckboxButton(
              value: isChecked,
              label: 'Accept Terms and Conditions',
              variant: Variant.success,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TimePicker(
              selectedTime: selectedTime,
              label: 'Select Time',
              onTimeChanged: (newTime) {
                setState(() {
                  selectedTime = newTime;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DatePicker(
              selectedDate: selectedDate,
              fontsize: 25,
              label: 'Select Date',
              onDateChanged: (newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
            ),
          ],
        ),
      )),
      bottomNavigationBar: CustomBottomBar(
        items: [
          BottomBarItem(
            icon: Icons.settings,
            label: AppLocalizations.of(context).settings,
            iconSize: 33,
          ),
          BottomBarItem(
            icon: Icons.person_pin_sharp,
            label: AppLocalizations.of(context).profile,
            iconSize: 33,
          ),
          BottomBarItem(
            icon: Icons.assignment,
            label: AppLocalizations.of(context).uiKit,
            iconSize: 33,
          ),
        ],
        selectedIndex: 2,
        onItemSelected: (index) {
          if (index == 1) {
            RouteUtils.setRootPage(context, route.profilePage);
          }
          if (index == 0) {
            RouteUtils.setRootPage(context, route.settingsPage);
          }
        },
      ),
    );
  }
}
