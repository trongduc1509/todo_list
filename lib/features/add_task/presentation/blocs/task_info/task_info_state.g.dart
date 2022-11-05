// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_info_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaskInfoStateCWProxy {
  TaskInfoState detail(Task? detail);

  TaskInfoState inititalId(int? inititalId);

  TaskInfoState isCreating(bool isCreating);

  TaskInfoState isLoading(bool isLoading);

  TaskInfoState selectedStartTime(DateTime? selectedStartTime);

  TaskInfoState tempNote(String? tempNote);

  TaskInfoState tempTitle(String? tempTitle);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskInfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskInfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskInfoState call({
    Task? detail,
    int? inititalId,
    bool? isCreating,
    bool? isLoading,
    DateTime? selectedStartTime,
    String? tempNote,
    String? tempTitle,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaskInfoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaskInfoState.copyWith.fieldName(...)`
class _$TaskInfoStateCWProxyImpl implements _$TaskInfoStateCWProxy {
  final TaskInfoState _value;

  const _$TaskInfoStateCWProxyImpl(this._value);

  @override
  TaskInfoState detail(Task? detail) => this(detail: detail);

  @override
  TaskInfoState inititalId(int? inititalId) => this(inititalId: inititalId);

  @override
  TaskInfoState isCreating(bool isCreating) => this(isCreating: isCreating);

  @override
  TaskInfoState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  TaskInfoState selectedStartTime(DateTime? selectedStartTime) =>
      this(selectedStartTime: selectedStartTime);

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
    Object? detail = const $CopyWithPlaceholder(),
    Object? inititalId = const $CopyWithPlaceholder(),
    Object? isCreating = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? selectedStartTime = const $CopyWithPlaceholder(),
    Object? tempNote = const $CopyWithPlaceholder(),
    Object? tempTitle = const $CopyWithPlaceholder(),
  }) {
    return TaskInfoState(
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
      selectedStartTime: selectedStartTime == const $CopyWithPlaceholder()
          ? _value.selectedStartTime
          // ignore: cast_nullable_to_non_nullable
          : selectedStartTime as DateTime?,
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
