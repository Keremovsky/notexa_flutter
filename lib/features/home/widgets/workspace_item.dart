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

  const WorkspaceItem({super.key, required this.workspace, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await context.read<WorkspaceController>().getWorkspace(
          workspace,
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
          color: ColorConstants.lightFilledButton,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: SizedBox(
            child: Row(
              children: [
                const Icon(Icons.work),
                const Spacer(),
                Text(workspace.name, style: context.displayLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
