import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/custom_button.dart';
import 'package:flutter_boilerplate/widgets/date_picker.dart';
import 'package:flutter_boilerplate/widgets/dropdown.dart';
import 'package:flutter_boilerplate/widgets/loading_widget.dart';
import 'package:flutter_boilerplate/widgets/radio_button.dart';
import 'package:flutter_boilerplate/widgets/text_input.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';
import 'package:flutter_boilerplate/widgets/time_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../routes/route.dart' as route;

enum Gender { male, female, other }

final nameProvider = StateProvider<String>((_) => '');

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(
          title: const Text("Profile"),
          showActionButton: true,
          iconName: Icons.language,
          actionButtonColor: Colors.black,
          onClick: () {},
          bgColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                        controller: nameController,
                        labelText: "Name",
                        hintText: "Enter your name",
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          ref
                              .read(nameProvider.notifier)
                              .update((state) => val);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    DatePicker(
                      selectedDate: selectedDate,
                      fontsize: FontSize.large,
                      label: 'Date of Birth',
                      onDateChanged: (newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TimePicker(
                      selectedTime: selectedTime,
                      label: 'Opening Time',
                      onTimeChanged: (newTime) {
                        setState(() {
                          selectedTime = newTime;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropDown(
                      items: const ["English", "Spanish", "German"],
                      onChanged: (val) => {print("selected val = $val")},
                      labelText: "Choose language",
                      filled: true,
                      fillColor: AppColors.gray3,
                      borderRadius: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
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
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      btnLabel: "Save",
                      onClick: () {
                        const LoadingProgressBar();
                        Navigator.pushNamed(context, route.homePage);
                        // Future.delayed(const Duration(seconds: 20));
                        // Navigator.of(context).pop();
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
                  ],
                ))));
  }
}
