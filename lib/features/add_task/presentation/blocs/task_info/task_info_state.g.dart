// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_info_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaskInfoStateCWProxy {
  TaskInfoState dataFilled(bool dataFilled);

  TaskInfoState detail(Task? detail);

  TaskInfoState inititalId(int? inititalId);

  TaskInfoState isCreating(bool isCreating);

  TaskInfoState isLoading(bool isLoading);

  TaskInfoState selectedDueTime(DateTime? selectedDueTime);

  TaskInfoState tempNote(String? tempNote);

  TaskInfoState tempTitle(String? tempTitle);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskInfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskInfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskInfoState call({
    bool? dataFilled,
    Task? detail,
    int? inititalId,
    bool? isCreating,
    bool? isLoading,
    DateTime? selectedDueTime,
    String? tempNote,
    String? tempTitle,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaskInfoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaskInfoState.copyWith.fieldName(...)`
class _$TaskInfoStateCWProxyImpl implements _$TaskInfoStateCWProxy {
  final TaskInfoState _value;

  const _$TaskInfoStateCWProxyImpl(this._value);

  @override
  TaskInfoState dataFilled(bool dataFilled) => this(dataFilled: dataFilled);

  @override
  TaskInfoState detail(Task? detail) => this(detail: detail);

  @override
  TaskInfoState inititalId(int? inititalId) => this(inititalId: inititalId);

  @override
  TaskInfoState isCreating(bool isCreating) => this(isCreating: isCreating);

  @override
  TaskInfoState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  TaskInfoState selectedDueTime(DateTime? selectedDueTime) =>
      this(selectedDueTime: selectedDueTime);

  @override
  TaskInfoState tempNote(String? tempNote) => this(tempNote: tempNote);

  @override
  TaskInfoState tempTitle(String? tempTitle) => this(tempTitle: tempTitle);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskInfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskInfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskInfoState call({
    Object? dataFilled = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? inititalId = const $CopyWithPlaceholder(),
    Object? isCreating = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? selectedDueTime = const $CopyWithPlaceholder(),
    Object? tempNote = const $CopyWithPlaceholder(),
    Object? tempTitle = const $CopyWithPlaceholder(),
  }) {
    return TaskInfoState(
      dataFilled:
          dataFilled == const $CopyWithPlaceholder() || dataFilled == null
              ? _value.dataFilled
              // ignore: cast_nullable_to_non_nullable
              : dataFilled as bool,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as Task?,
      inititalId: inititalId == const $CopyWithPlaceholder()
          ? _value.inititalId
          // ignore: cast_nullable_to_non_nullable
          : inititalId as int?,
      isCreating:
          isCreating == const $CopyWithPlaceholder() || isCreating == null
              ? _value.isCreating
              // ignore: cast_nullable_to_non_nullable
              : isCreating as bool,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      selectedDueTime: selectedDueTime == const $CopyWithPlaceholder()
          ? _value.selectedDueTime
          // ignore: cast_nullable_to_non_nullable
          : selectedDueTime as DateTime?,
      tempNote: tempNote == const $CopyWithPlaceholder()
          ? _value.tempNote
          // ignore: cast_nullable_to_non_nullable
          : tempNote as String?,
      tempTitle: tempTitle == const $CopyWithPlaceholder()
          ? _value.tempTitle
          // ignore: cast_nullable_to_non_nullable
          : tempTitle as String?,
    );
  }
}

extension $TaskInfoStateCopyWith on TaskInfoState {
  /// Returns a callable class that can be used as follows: `instanceOfTaskInfoState.copyWith(...)` or like so:`instanceOfTaskInfoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaskInfoStateCWProxy get copyWith => _$TaskInfoStateCWProxyImpl(this);
}
