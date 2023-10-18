import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/login/login_page.dart';
import 'package:flutter_boilerplate/routes/route.dart';
import 'package:flutter_boilerplate/utils/loading_utils.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/utils/shared_preferences_utils.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/bottom_bar.dart';
import 'package:flutter_boilerplate/widgets/circle_avatar.dart';
import 'package:flutter_boilerplate/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  int selectedIndex = 0;

  void onLogout() async {
    LoadingUtils(context).startLoading();
    await Future.delayed(const Duration(seconds: 3));
    LoadingUtils(context).stopLoading();
    storeLoggedInStatus(false);
    ref.read(emailProvider.notifier).update((state) => "");
    ref.read(passwordProvider.notifier).update((state) => "");
    RouteUtils.setRootPage(context, loginPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 217, 227),
      appBar: CustomAppBar(
        title: const Text("Profile"),
        showActionButton: true,
        iconName: Icons.logout,
        actionButtonColor: AppColors.dark,
        onClick: () async {
          onLogout();
        },
        bgColor: const Color.fromARGB(255, 67, 240, 73),
      ),
      body: ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      radius: 35.0,
                      child: const Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                    ),
                    CustomCircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 90.0,
                      child: const CircleAvatar(
                        radius: 80.0,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      ),
                    ),
                    CustomCircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      radius: 35.0,
                      child: const Icon(
                        Icons.message,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'John',
                  style: TextStyle(
                    fontSize: FontSize.extralarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: AppColors.positive,
                    fontSize: FontSize.large,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Color(0xFFeec6ca),
                        child: const ListTile(
                          title: Text(
                            '5000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.extralarge,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Followers',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: FontSize.header,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xFFffb7c3),
                        child: const ListTile(
                          title: Text(
                            '5000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.extralarge,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Following',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: FontSize.header,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: FontSize.header,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'john@gmail.com',
                        style: TextStyle(
                          fontSize: FontSize.miniheader,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'GitHub',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: FontSize.header,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'https://github.com/john',
                        style: TextStyle(
                          fontSize: FontSize.miniheader,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Linkedin',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: FontSize.header,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'www.linkedin.com/in/john-6bba86208',
                        style: TextStyle(
                          fontSize: FontSize.miniheader,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ]),
      bottomNavigationBar: CustomBottomBar(
        items: [
          BottomBarItem(
            icon: Icons.settings,
            label: AppLocalizations.of(context).settings,
            iconSize: 35,
          ),
          BottomBarItem(
            icon: Icons.person_pin_sharp,
            label: AppLocalizations.of(context).profile,
            iconSize: 35,
          ),
          BottomBarItem(
            icon: Icons.assignment,
            label: AppLocalizations.of(context).uiKit,
            iconSize: 35,
          ),
        ],
        selectedIndex: 1,
        onItemSelected: (index) async {
          if (index == 2) {
            // LoadingUtils(context).startLoading();
            // await Future.delayed(const Duration(seconds: 1));
            // LoadingUtils(context).stopLoading();
            RouteUtils.goToPage(context, route.homePage);
          }
          if (index == 0) {
            RouteUtils.goToPage(context, route.settingsPage);
          }
          // setState(() {
          //   selectedIndex = index;
          // });
        },
      ),
    );
  }
}
