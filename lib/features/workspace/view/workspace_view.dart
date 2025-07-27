import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_button.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/state/workspace_view_state.dart';
import 'package:provider/provider.dart';

@RoutePage()
class WorkspaceView extends StatefulWidget {
  const WorkspaceView({super.key});

  @override
  WorkspaceViewState createState() => _WorkspaceViewState();
}

class _WorkspaceViewState extends WorkspaceViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              // TODO
              SizedBox(
                width: context.screenWidth * 0.25,
                child: Consumer<WorkspaceController>(
                  builder: (context, value, _) {
                    final docs = value.documents;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return Text(docs[index].name);
                        },
                      ),
                    );
                  },
                ),
              ),
              CustomButton(onPressed: onUploadDocumentPressed, child: Text("")),
            ],
          ),
        ],
      ),
    );
  }
}
