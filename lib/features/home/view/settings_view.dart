import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/home/state/settings_view_state.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends SettingsViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: []));
  }
}
