// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:meds/screens/account/help_center.dart';
import 'package:meds/screens/termsNconditions.dart';
import 'package:meds/screens/account/user_profile.dart';
import 'package:meds/sevices/logout.dart';
import 'package:settings_ui/settings_ui.dart';

// import 'package:settings/usersettings.dart';

class SettingsPageUI extends StatefulWidget {
  const SettingsPageUI({super.key});

  @override
  _SettingPageUIState createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingsPageUI> {
  bool ValueNotify1 = false;
  bool ValueNotify2 = false;

  onChangeFunction2(bool newValue2) {
    setState(() {
      ValueNotify2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        elevation: 5,
      ),
      body: SettingsList(
        lightTheme: const SettingsThemeData(
          settingsListBackground: Color.fromRGBO(241, 250, 251, 1),
        ),
        sections: [
          SettingsSection(
            title: Text(
              'Account Settings',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text('Edit Profile'),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              'Other',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                  leading: const Icon(Icons.help_outline_outlined),
                  title: const Text('Help Center'),
                  onPressed: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpCenter()),
                    );
                  }),
              SettingsTile.navigation(
                leading: const Icon(Icons.description_outlined),
                title: const Text('Terms and Conditions'),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsAndConditions()),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text(''),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.login_rounded),
                // title: const Text('Sign Out'),
                title: const Text('Sign Out'),
                onPressed: (context) {
                  signOut(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
