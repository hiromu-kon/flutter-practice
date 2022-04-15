import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings UI')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Section',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Environment',
                subtitle: 'Production',
                leading: Icon(Icons.cloud_outlined),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                title: 'Phone number',
                leading: Icon(Icons.phone),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Email',
                leading: Icon(Icons.email),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Sign out',
                leading: Icon(Icons.logout),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Look app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: isSwitched,
                onToggle: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: isSwitched,
                onToggle: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Change Password',
                leading: Icon(Icons.lock),
                switchValue: isSwitched,
                onToggle: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              )
            ],
          ),
          SettingsSection(
            title: 'Mac',
            tiles: [
              SettingsTile(
                title: 'Terms of Service',
                leading: Icon(Icons.description),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Open source Licenses',
                leading: Icon(Icons.source),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
