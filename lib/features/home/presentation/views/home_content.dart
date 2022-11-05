import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/definitions/colors.dart';
import 'package:todo_list/features/add_task/presentation/views/add_task_page.dart';
import 'package:todo_list/features/home/presentation/blocs/tasks_list/tasks_list_event.dart';
import 'package:todo_list/features/home/presentation/widgets/task_tile.dart';

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
    // _scrollController.addListener(() {
    //   if (_scrollController.position.atEdge) {
    //     var isTop = _scrollController.position.pixels == 0;
    //     if (!isTop) {
    //       mContext
    //           .read<WaitingConfirmDatLeBloc>()
    //           .add(const WaitingConfirmDatLeLoadMore());
    //     }
    //   }
    // });
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
                        onPressed: () {},
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
                        ? SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            //controller: _scrollController,
                            child: Column(
                              children: [
                                ListView.separated(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 12.0),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.tasksList?.length ?? 0,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10.0,
                                  ),
                                  itemBuilder: (context, index) => TaskTile(
                                    task: state.tasksList?[index],
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
                          )
                        : Container(
                            color: AppColor().backgroundHome,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: NodataView(
                                description: (txt.text != '')
                                    ? 'Chưa tìm thấy kết quả bạn cần rồi.\nHãy thử lại nhé!'
                                    : 'Không có dữ liệu!',
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
