import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/color_schemes.dart';
import 'package:flutter_boilerplate/modules/login/login_page.dart';
import 'package:flutter_boilerplate/routes/route.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/loading_utils.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/utils/shared_preferences_utils.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/bottom_bar.dart';
import 'package:flutter_boilerplate/widgets/circle_avatar.dart';
import 'package:flutter_boilerplate/widgets/headers.dart';
import 'package:flutter_boilerplate/widgets/paragraph.dart';
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
    final AppColors appColors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: setTextWithStyle(AppLocalizations.of(context).profile,
            Theme.of(context).textTheme.headlineSmall),
        showActionButton: true,
        iconName: Icons.logout,
        onClick: () async {
          onLogout();
        },
      ),
      body: ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCircleAvatar(
                      backgroundColor: AppColorsPalette.secondary2,
                      radius: 35.0,
                      child: const Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                    ),
                    CustomCircleAvatar(
                      backgroundColor:
                          appColors.gray2 ?? AppColorsPalette.gray2,
                      radius: 90.0,
                      child: const CircleAvatar(
                        radius: 80.0,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      ),
                    ),
                    CustomCircleAvatar(
                      backgroundColor: AppColorsPalette.secondary2,
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
                const Header1(
                  title: "John",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Header3(title: "Flutter Developer"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: AppColorsPalette.pink2,
                        child: const ListTile(
                          title: Header2(title: "5000"),
                          subtitle: Header4(title: "Followers"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColorsPalette.pink,
                        child: const ListTile(
                          title: Header2(title: "5000"),
                          subtitle: Header4(title: "Following"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Column(
                  children: <Widget>[
                    ListTile(
                      title: Header4(
                        title: "Email",
                        textColor: AppColorsPalette.orange,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Paragraph(text: "john@gmail.com"),
                    ),
                    Divider(),
                    ListTile(
                      title: Header4(
                        title: "GitHub",
                        textColor: AppColorsPalette.orange,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Paragraph(text: "https://github.com/john"),
                    ),
                    Divider(),
                    ListTile(
                      title: Header4(
                        title: "Linkedin",
                        textColor: AppColorsPalette.orange,
                        textAlign: TextAlign.left,
                      ),
                      subtitle:
                          Paragraph(text: "www.linkedin.com/in/john-6bba86208"),
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
        selectedIndex: 1,
        onItemSelected: (index) async {
          if (index == 2) {
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
