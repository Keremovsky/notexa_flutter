import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/core/models/workspace_list_model/workspace_list_item_model.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:provider/provider.dart';

class WorkspaceItem extends StatelessWidget {
  final WorkspaceListItemModel workspace;
  final double? height;
  final double? width;
  final void Function() onWorkspaceRemoved;

  const WorkspaceItem({
    super.key,
    required this.workspace,
    this.height,
    this.width,
    required this.onWorkspaceRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final result = await context.read<WorkspaceController>().getWorkspace(
            workspace.id,
            workspace.name,
          );

          result.fold(
            () {
              context.pushRoute(WorkspaceViewRoute());
            },
            (error) {
              context.read<FeedbackUtil>().showSnackBar(context, error.message);
            },
          );
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(56, 149, 255, 0.671),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: SizedBox(
              child: Row(
                children: [
                  const Icon(Icons.work),
                  const Spacer(),
                  Text(workspace.name, style: context.displayLarge),
                  SizedBox(width: 25),
                  SizedBox(
                    width: 25,
                    child: TextButton(
                      onPressed: () async {
                        final result = await context.read<FeedbackUtil>().showMessageBox(
                          context,
                          "Are you sure?",
                          "Workspace will be deleted for forever. This action is not undone.",
                        );

                        if (result != null && result && context.mounted) {
                          final result = await context
                              .read<WorkspaceController>()
                              .removeWorkspace(workspace.id);

                          result.fold(
                            () {
                              onWorkspaceRemoved();
                            },
                            (error) {
                              context.read<FeedbackUtil>().showSnackBar(
                                context,
                                error.message,
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      child: Icon(
                        Icons.remove_circle_outline,
                        size: 20,
                        color: ColorConstants.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
