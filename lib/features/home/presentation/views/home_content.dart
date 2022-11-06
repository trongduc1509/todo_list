import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/definitions/colors.dart';
import 'package:todo_list/definitions/util/notifier.dart';
import 'package:todo_list/features/add_task/presentation/views/add_task_page.dart';
import 'package:todo_list/features/home/presentation/blocs/tasks_list/tasks_list_event.dart';
import 'package:todo_list/features/home/presentation/widgets/task_tile.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/services/local_noti_service.dart';

import '../../../../definitions/enum/filter.dart';
import '../../../../definitions/helper/delay_timer.dart';
import '../../../../definitions/widgets/appbar_panel.dart';
import '../../../../definitions/widgets/common_txt.dart';
import '../../../../definitions/widgets/nodata_view.dart';
import '../blocs/tasks_list/tasks_list_bloc.dart';
import '../blocs/tasks_list/tasks_list_state.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // final _scrollController = ScrollController();
  TextEditingController txt = TextEditingController();
  final _debouncer = DelayTimer(milliseconds: 650);
  late BuildContext mContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      backgroundColor: AppColor().scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'My Tasks',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            wordSpacing: 1.0,
          ),
        ),
      ),
      body: BlocBuilder<TasksListBloc, TasksListState>(
        builder: (context, state) {
          return CustomAppbarPanel(
            isTopColor: false,
            siliverHeight: 0,
            panel: Row(
              children: [
                Expanded(
                    child: CommonSearchTxt(
                  controller: txt,
                  hintText: 'Task title, content',
                  onChanged: (searchTxt) {
                    context
                        .read<TasksListBloc>()
                        .add(TasksListLoadEvent(searchStr: searchTxt));
                  },
                  onClear: () {
                    context
                        .read<TasksListBloc>()
                        .add(const TasksListLoadEvent(searchStr: ''));
                  },
                  hiddenScan: true,
                )),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 1, color: AppColor().greyBorder),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: IconButton(
                        icon: const SizedBox(
                          height: 24,
                          width: 24,
                          child: Image(
                            image: AssetImage('assets/images/filter.png'),
                            alignment: Alignment.center,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        onPressed: () {
                          Notifier.showCheckBottomSheet(
                            context,
                            title: 'Filter',
                            listData: FilterBy.values
                                .map((e) => e.statusFilterBy)
                                .toList(),
                            selectedIndex: state.filterBy?.id,
                            onSelected: (indexFilter) {
                              context
                                  .read<TasksListBloc>()
                                  .add(TasksListLoadEvent(
                                    searchStr: txt.text.trim(),
                                    filterBy: filterById(indexFilter),
                                  ));
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            content: state.isLoading
                ? const CupertinoActivityIndicator()
                : RefreshIndicator(
                    onRefresh: pullRefresh,
                    child: (state.tasksList?.isNotEmpty ?? false)
                        ? NotificationListener<OverscrollIndicatorNotification>(
                            onNotification:
                                (OverscrollIndicatorNotification overscroll) {
                              overscroll.disallowIndicator();
                              return true;
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              //controller: _scrollController,
                              child: Column(
                                children: [
                                  ListView.separated(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0, top: 12.0),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.tasksList?.length ?? 0,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 10.0,
                                    ),
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () async {
                                        await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddTaskPage(
                                                        id: state
                                                            .tasksList?[index]
                                                            .id)));
                                        pullRefresh();
                                      },
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const DrawerMotion(),
                                          children: [
                                            if (state.tasksList?[index]
                                                    .isCompleted !=
                                                true)
                                              SlidableAction(
                                                onPressed: (context) {
                                                  mContext.read<TasksListBloc>().add(
                                                      TasksListUpdateCompletedSingleEvent(
                                                          updateTask: state
                                                                  .tasksList?[
                                                                      index]
                                                                  .copy(
                                                                      isCompleted:
                                                                          true) ??
                                                              Task(
                                                                title: '',
                                                                note: '',
                                                                dueTime:
                                                                    DateTime
                                                                        .now(),
                                                              )));
                                                  if (state.tasksList?[index]
                                                          .id !=
                                                      null) {
                                                    LocalNotiService
                                                        .cancelIdentifiedNoti(
                                                            state
                                                                .tasksList![
                                                                    index]
                                                                .id!);
                                                  }
                                                },
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                                icon:
                                                    Icons.check_circle_rounded,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            SlidableAction(
                                              onPressed: (context) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Confirm your deletion'),
                                                        content: const Text(
                                                            'Your task will be deleted permanently! Do you want to do it?'),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'CANCEL')),
                                                          TextButton(
                                                            onPressed: () {
                                                              mContext
                                                                  .read<
                                                                      TasksListBloc>()
                                                                  .add(TasksListRemoveTaskEvent(
                                                                      delTask: state
                                                                              .tasksList?[
                                                                          index]));
                                                              if (state
                                                                      .tasksList?[
                                                                          index]
                                                                      .id !=
                                                                  null) {
                                                                LocalNotiService
                                                                    .cancelIdentifiedNoti(state
                                                                        .tasksList![
                                                                            index]
                                                                        .id!);
                                                              }
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'CONFIRM'),
                                                          )
                                                        ],
                                                      );
                                                    });
                                              },
                                              backgroundColor:
                                                  const Color(0xFFFE4A49),
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ],
                                        ),
                                        child: TaskTile(
                                          task: state.tasksList?[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // if (state.showLoadding)
                                  //   const SizedBox(
                                  //     height: 40,
                                  //     child: CupertinoActivityIndicator(),
                                  //   ),
                                  // if (!state.showLoadding)
                                  //   const SizedBox(
                                  //     height: 40,
                                  //   )
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            color: AppColor().backgroundHome,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: NodataView(
                                description: (txt.text != '')
                                    ? 'No result match your searching.\nPlease try again!'
                                    : 'No data!',
                                bgColor: AppColor().backgroundHome,
                              ),
                            ),
                          ),
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTaskPage()));
          pullRefresh();
        },
        mini: true,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> pullRefresh() async {
    mContext.read<TasksListBloc>().add(const TasksListLoadEvent());
    txt.text = '';
    FocusScope.of(context).unfocus();
  }
}
