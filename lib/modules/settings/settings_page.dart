import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';
import 'package:flutter_boilerplate/widgets/bottom_bar.dart';
import 'package:flutter_boilerplate/theme.dart';
import 'package:flutter_boilerplate/widgets/dropdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';
import '../../routes/route.dart' as route;

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends ConsumerState<SettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context).settings),
        showActionButton: true,
        iconName: Icons.logout,
        actionButtonColor: AppColors.dark,
        onClick: () {},
        bgColor: AppColors.warning,
      ),
      body: SettingsList(sections: [
        SettingsSection(
          title: Text(AppLocalizations.of(context).systemSettings),
          tiles: [
            SettingsTile(
              title: Text(AppLocalizations.of(context).languages),
              description: const Text('English'),
              leading: const Icon(Icons.language),
              onPressed: (BuildContext context) {
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
                );
              },
            ),
            SettingsTile.switchTile(
              initialValue: isSwitched,
              title: Text(AppLocalizations.of(context).darkTheme),
              leading: const Icon(Icons.phone_android),
              onToggle: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: Text(AppLocalizations.of(context).systemSecurity),
          tiles: [
            SettingsTile(
              title: Text(AppLocalizations.of(context).security),
              description: Text(AppLocalizations.of(context).fingerprint),
              leading: const Icon(Icons.lock),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.switchTile(
              title: Text(AppLocalizations.of(context).useFingerprint),
              leading: const Icon(Icons.fingerprint),
              initialValue: true,
              onToggle: (value) {},
            ),
          ],
        ),
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
        selectedIndex: 0,
        onItemSelected: (index) {
          if (index == 1) {
            RouteUtils.setRootPage(context, route.profilePage);
          }
          if (index == 2) {
            RouteUtils.setRootPage(context, route.homePage);
          }
        },
      ),
    );
  }
}
