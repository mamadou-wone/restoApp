import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  bool value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Langue',
                subtitle: 'Français',
                leading: Icon(Icons.language),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Divers',
            tiles: [
              SettingsTile(
                title: 'Conditions d\'utilisation',
                leading: Icon(Icons.description),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              SettingsTile(
                title: 'Contact',
                leading: Icon(Icons.settings_phone),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          )
        ],
      ),
    );
  }
}
