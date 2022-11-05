// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TasksListStateCWProxy {
  TasksListState filterBy(FilterBy? filterBy);

  TasksListState isLoading(bool isLoading);

  TasksListState searchStr(String? searchStr);

  TasksListState tasksList(List<Task>? tasksList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TasksListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TasksListState(...).copyWith(id: 12, name: "My name")
  /// ````
  TasksListState call({
    FilterBy? filterBy,
    bool? isLoading,
    String? searchStr,
    List<Task>? tasksList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTasksListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTasksListState.copyWith.fieldName(...)`
class _$TasksListStateCWProxyImpl implements _$TasksListStateCWProxy {
  final TasksListState _value;

  const _$TasksListStateCWProxyImpl(this._value);

  @override
  TasksListState filterBy(FilterBy? filterBy) => this(filterBy: filterBy);

  @override
  TasksListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  TasksListState searchStr(String? searchStr) => this(searchStr: searchStr);

  @override
  TasksListState tasksList(List<Task>? tasksList) => this(tasksList: tasksList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TasksListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TasksListState(...).copyWith(id: 12, name: "My name")
  /// ````
  TasksListState call({
    Object? filterBy = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? searchStr = const $CopyWithPlaceholder(),
    Object? tasksList = const $CopyWithPlaceholder(),
  }) {
    return TasksListState(
      filterBy: filterBy == const $CopyWithPlaceholder()
          ? _value.filterBy
          // ignore: cast_nullable_to_non_nullable
          : filterBy as FilterBy?,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      searchStr: searchStr == const $CopyWithPlaceholder()
          ? _value.searchStr
          // ignore: cast_nullable_to_non_nullable
          : searchStr as String?,
      tasksList: tasksList == const $CopyWithPlaceholder()
          ? _value.tasksList
          // ignore: cast_nullable_to_non_nullable
          : tasksList as List<Task>?,
    );
  }
}

extension $TasksListStateCopyWith on TasksListState {
  /// Returns a callable class that can be used as follows: `instanceOfTasksListState.copyWith(...)` or like so:`instanceOfTasksListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TasksListStateCWProxy get copyWith => _$TasksListStateCWProxyImpl(this);
}
