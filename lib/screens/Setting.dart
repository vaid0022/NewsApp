import 'package:flutter/material.dart';
import 'package:newsspp/Providers/Provider.dart';
import 'package:newsspp/Service/sharedPrefrence.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: Consumer<ThemeProvider>(
        builder: (_, provider, __) {
          return SwitchListTile.adaptive(
            title: Text("ThemeMode"),
            subtitle: Text(
              "This thememode only for  transision between Light and Dark Theme.",
            ),
            onChanged: (value) async{
              provider.setTheme(Value: value);
              await sharedprefrence.SetTheme(value: value);
            },value: provider.getTheme(),
          );
        },
      ),
    );
  }
}
