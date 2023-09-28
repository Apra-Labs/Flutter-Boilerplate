import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/login/presentation.dart';
import 'package:flutter_boilerplate/modules/profile/presentation.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/checkbox.dart';
import 'package:flutter_boilerplate/widgets/circularbar.dart';
import 'package:flutter_boilerplate/widgets/custom_button.dart';
import 'package:flutter_boilerplate/widgets/date_picker.dart';
import 'package:flutter_boilerplate/widgets/dropdown.dart';
import 'package:flutter_boilerplate/widgets/loading_widget.dart';
import 'package:flutter_boilerplate/widgets/radio_button.dart';
import 'package:flutter_boilerplate/widgets/text_input.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';
import 'package:flutter_boilerplate/widgets/time_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final email = ref.watch(emailProvider);
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("UI Kit"),
        showActionButton: true,
        iconName: Icons.language,
        actionButtonColor: Colors.black,
        onClick: () {},
        bgColor: Colors.amber[300],
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
            Text(
              "Welcome $name",
              style: const TextStyle(
                  fontSize: FontSize.extralarge, color: AppColors.blue),
            ),
            const SizedBox(
              height: 10,
            ),
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
            const SizedBox(
              height: 20,
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
                "German",
                "Spanish",
              ],
              onChanged: (val) => {print("selected val = $val")},
              labelText: "Choose language",
              filled: true,
              fillColor: AppColors.gray3,
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
            const CircularProgress(),
            const SizedBox(
              height: 20,
            ),
            CheckboxButton(
              value: isChecked,
              label: 'Accept Terms and Conditions',
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
    );
  }
}
