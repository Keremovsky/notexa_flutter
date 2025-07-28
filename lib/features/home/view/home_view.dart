import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_button.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/core/models/workspace_list_model/workspace_list_item_model.dart';
import 'package:flutter_mobile/features/home/state/home_view_state.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  final List<WorkspaceListItemModel> workspaces;

  const HomeView({super.key, required this.workspaces});

  @override
  HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: context.screenWidth * 0.5,
            child: Column(
              children: [
                CustomButton(
                  onPressed: onProfilePressed,
                  child: Text(LocaleKeys.goToProfile.tr()),
                ),
                SizedBox(height: 10),
                CustomButton(
                  onPressed: onSettingsPressed,
                  child: Text(LocaleKeys.settings.tr()),
                ),
                SizedBox(height: 10),
                CustomButton(
                  onPressed: onExitPressed,
                  child: Text(LocaleKeys.exitFromAccount.tr()),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.7,
            width: context.screenWidth * 0.5,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.workspaces.length,
                    itemBuilder: (context, index) {
                      final workspace = widget.workspaces[index];

                      return CustomButton(
                        onPressed: () => onWorkspacePressed(workspace.id),
                        child: Text(workspace.name),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
