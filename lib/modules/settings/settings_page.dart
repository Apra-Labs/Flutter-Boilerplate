import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/providers/providers.dart';
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
  @override
  Widget build(BuildContext context) {
    var isDarkTheme = ref.read(appThemeProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          //functions - provide style as arg in 1 func.
          AppLocalizations.of(context).settings,
          style: Theme.of(context)
              .textTheme
              .headlineSmall, //create header & paragraph widgets
        ),
        showActionButton: true,
        iconName: Icons.logout,
        onClick: () {},
      ),
      body: SettingsList(sections: [
        SettingsSection(
          title: Text(
            AppLocalizations.of(context).systemSettings,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          tiles: [
            SettingsTile(
              title: Text(
                AppLocalizations.of(context).languages,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
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
              initialValue: isDarkTheme,
              title: Text(
                AppLocalizations.of(context).darkTheme,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(Icons.phone_android),
              onToggle: (value) {
                setState(() {
                  ref.read(appThemeProvider.notifier).state = value;
                  isDarkTheme = value;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: Text(
            AppLocalizations.of(context).systemSecurity,
            style: Theme.of(context).textTheme.titleLarge,
          ),
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
