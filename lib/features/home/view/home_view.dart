import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_button.dart';
import 'package:flutter_mobile/core/components/custom_loading_indicator.dart';
import 'package:flutter_mobile/core/components/custom_text_field.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/home/state/home_view_state.dart';
import 'package:flutter_mobile/features/home/widgets/workspace_item.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
          children: [
            SizedBox(
              width: context.screenWidth * 0.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: onProfilePressed,

                      child: Row(
                        children: [
                          Icon(Icons.man, size: 28),
                          SizedBox(width: 30),
                          Text(LocaleKeys.profile.tr()),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: onSettingsPressed,

                      child: Row(
                        children: [
                          Icon(Icons.settings, size: 28),
                          SizedBox(width: 30),
                          Text(LocaleKeys.settings.tr()),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: onExitPressed,

                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app, size: 28),
                          SizedBox(width: 30),
                          Text(LocaleKeys.exit.tr()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Column(
                  children: [
                    _FirstTitle(),
                    _SecondTitle(),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        CustomTextField(
                          height: 40,
                          width: 300,
                          controller: controller,
                        ),
                        SizedBox(width: 5),
                        CustomButton(
                          onPressed: onCreateWorkspacePressed,
                          height: 40,
                          width: 40,
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    Divider(height: 20),
                    SizedBox(height: 5),
                    FutureBuilder(
                      future: future,
                      builder: (context, snapshot) {
                        final data = snapshot.data;

                        if (snapshot.connectionState == ConnectionState.done &&
                            data != null) {
                          return data.fold(
                            (error) {
                              // TODO
                              return Text("error");
                            },
                            (workspaces) {
                              return Expanded(
                                child: ListView.separated(
                                  itemCount: workspaces.length,
                                  itemBuilder: (context, index) {
                                    final workspace = workspaces[index];

                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: WorkspaceItem(
                                        height: 60,
                                        width: context.screenWidth * 0.4,
                                        workspace: workspace,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 20);
                                  },
                                ),
                              );
                            },
                          );
                        }

                        return CustomLoadingIndicator();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstTitle extends StatelessWidget {
  const _FirstTitle();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text.rich(
        TextSpan(
          text: "Welcome to ",
          style: context.titleMedium,
          children: [
            TextSpan(
              text: "home",
              style: context.titleMedium?.copyWith(color: ColorConstants.lightMain),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondTitle extends StatelessWidget {
  const _SecondTitle();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text.rich(
        TextSpan(
          text: "Let's start to ",
          style: context.titleLarge,
          children: [
            TextSpan(
              text: "study",
              style: context.titleLarge?.copyWith(color: ColorConstants.lightMain),
            ),
          ],
        ),
      ),
    );
  }
}
