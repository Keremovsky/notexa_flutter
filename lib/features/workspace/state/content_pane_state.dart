import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/pdf/pdf_service.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/pane/content_pane.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:provider/provider.dart';

abstract class ContentPaneState extends State<ContentPane> {
  late Future<fp.Either<File, fp.Either<FailureModel, String>>> future;

  @override
  void initState() {
    super.initState();
    future = getContent(widget.selectedItem);
  }

  @override
  void didUpdateWidget(covariant ContentPane oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedItem.id != widget.selectedItem.id ||
        oldWidget.selectedItem.type != widget.selectedItem.type) {
      setState(() {
        future = getContent(widget.selectedItem);
      });
    }
  }

  Future<fp.Either<File, fp.Either<FailureModel, String>>> getContent(
    SelectedItem selectedItem,
  ) async {
    if (selectedItem.type == SelectedItemType.none) {
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      return fp.Right(fp.Left(FailureModel.fail("")));
    }

    if (selectedItem.type == SelectedItemType.document) {
      final result = await context.read<PdfService>().getPdfFromCache(
        selectedItem.name,
      );

      if (result != null) {
        return fp.Left(result);
      }

      final fetchResult = await context
          .read<WorkspaceController>()
          .getFileFromWorkspace(selectedItem.id);

      return fetchResult.fold(
        (error) {
          return fp.Right(fp.Left(error));
        },
        (data) async {
          final isPdfSaved = await context.read<PdfService>().savePdfToCache(
            selectedItem.name,
            data,
          );

          return isPdfSaved.fold(
            () async {
              final file = await context.read<PdfService>().getPdfFromCache(
                selectedItem.name,
              );
              return fp.Left(file!);
            },
            (error) {
              return fp.Right(fp.Left(error));
            },
          );
        },
      );
    } else if (selectedItem.type == SelectedItemType.note) {
      final result = await context.read<WorkspaceController>().getNoteFromWorkspace(
        selectedItem.id,
      );

      return await result.fold((error) {
        return fp.Right(fp.Left(error));
      }, (content) => fp.Right(fp.Right(content)));
    } else {
      return fp.Right(fp.Left(FailureModel.fail("An unknown error occurred.")));
    }
  }
}
