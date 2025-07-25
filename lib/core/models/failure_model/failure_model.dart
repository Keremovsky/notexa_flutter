import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failure_model.freezed.dart';

@freezed
sealed class FailureModel with _$FailureModel {
  const FailureModel._();
  const factory FailureModel.fail(String message) = _Fail;
}
