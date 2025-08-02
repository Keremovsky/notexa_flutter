import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/chat/pane/chat_pane.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:provider/provider.dart';

abstract class ChatPaneState extends State<ChatPane> {
  String chatMode = "chat";
  String roleLevelMode = "child";
  List<DropdownMenuItem<String>> modeList = [
    DropdownMenuItem(value: "chat", child: Text("Chat")),
    DropdownMenuItem(value: "role", child: Text("Role-play")),
    DropdownMenuItem(value: "feynman", child: Text("Feynman")),
    DropdownMenuItem(value: "debate", child: Text("Debate")),
    DropdownMenuItem(value: "cases", child: Text("Case")),
    DropdownMenuItem(value: "reflect", child: Text("Reflect")),
  ];

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.selectedItem.type == SelectedItemType.note) {
      modeList.add(DropdownMenuItem(value: "editor", child: Text("Editor")));
    } else {
      if (chatMode == "editor") {
        chatMode = "chat";
      }
      modeList.removeWhere((item) {
        return item.value == "editor";
      });
    }

    context.read<ChatController>().loadChatData(
      widget.selectedItem.id,
      widget.selectedItem.type.name,
      chatMode,
    );
  }

  @override
  void didUpdateWidget(covariant ChatPane oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedItem.type == SelectedItemType.note) {
      modeList.add(DropdownMenuItem(value: "editor", child: Text("Editor")));
    } else {
      if (chatMode == "editor") {
        chatMode = "chat";
      }
      modeList.removeWhere((item) {
        return item.value == "editor";
      });
    }

    context.read<ChatController>().loadChatData(
      widget.selectedItem.id,
      widget.selectedItem.type.name,
      chatMode,
    );

    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 60,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void onChatModeChanged(String? value) async {
    if (value != null && value != chatMode) {
      final result = await context.read<ChatController>().loadChatData(
        widget.selectedItem.id,
        widget.selectedItem.type.name,
        value,
      );

      result.fold(
        () {
          setState(() {
            chatMode = value;
          });

          if (scrollController.hasClients) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          }
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(context, error.message);
        },
      );
    }
  }

  void onRoleLevelChanged(String? value) async {
    if (value != null && value != roleLevelMode) {
      setState(() {
        roleLevelMode = value;
      });
    }
  }

  void sendMessage(String prompt) async {
    final stream = context.read<ChatController>().sendPrompt(prompt);
    await for (final _ in stream) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 60,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  void onClearPressed() async {
    final isPermitted = await context.read<FeedbackUtil>().showMessageBox(
      context,
      "Are you sure?",
      "If chat history is cleared, there is no turning back",
    );

    if (isPermitted != null && isPermitted && mounted) {
      final result = await context.read<ChatController>().clearChat(
        widget.selectedItem.id,
        widget.selectedItem.type.name,
        chatMode,
      );

      result.fold(() {}, (error) {
        context.read<FeedbackUtil>().showSnackBar(context, error.message);
      });
    }
  }
}
