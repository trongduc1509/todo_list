import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../default.dart';

class TimePickerView extends StatelessWidget {
  const TimePickerView({
    Key? key,
    this.time,
    required this.active,
    required this.title,
    required this.onTimeChosen,
  }) : super(key: key);

  final DateTime? time;
  final bool active;
  final String title;
  final ValueChanged<DateTime> onTimeChosen;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          if (active) {
            var chosenTime = await showModalBottomSheet<DateTime>(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: (context) => buildSheetTime(
                context,
                time: time ?? DateTime.now(),
              ),
            );
            if (chosenTime != null) {
              chosenTime = chosenTime.add(const Duration(
                seconds: 0,
              ));
              onTimeChosen(chosenTime);
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: DefaultStyle().greyDisable)),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: DefaultStyle()
                          .t12Medium
                          .apply(color: DefaultStyle().greySecondary),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      time != null
                          ? convertDateFrom(time!, "HH:mm aa")
                          : 'Select start time',
                      style: DefaultStyle()
                          .t16Medium
                          .apply(color: DefaultStyle().blackTitle),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.access_time_rounded,
                size: 20.0,
                color: Colors.black.withOpacity(0.45),
              ),
            ],
          ),
        ),
      );
}

Widget buildSheetTime(BuildContext context, {required DateTime time}) {
  time = DateTime(time.year, time.month, time.day, time.hour);
  var chosenTime = DateTime(time.year, time.month, time.day, time.hour);
  return StatefulBuilder(
    builder: ((context, setState) => Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close,
                                semanticLabel: "close",
                                size: 16,
                                color: Colors.black))),
                    Center(
                        child:
                            Text("Select time", style: DefaultStyle().t16Bold))
                  ],
                ),
              ),
              const Divider(
                height: 1,
              ),
              Expanded(
                child: CupertinoApp(
                  theme: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: DefaultStyle()
                          .t16Medium
                          .apply(color: Colors.black, fontSizeDelta: 2.5),
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', 'US'), // arabic, no country code
                  ],
                  builder: (context, widget) => CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: chosenTime,
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        chosenTime = newDateTime;
                      });
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  child: const Text("Confirm"),
                  onPressed: () {
                    Navigator.of(context).pop(chosenTime);
                  },
                ),
              )
            ],
          ),
        )),
  );
}

String convertDateFrom(DateTime from, String format) {
  final docDateTime = DateTime.parse(from.toString());
  var dateFormated = DateFormat(format).format(docDateTime);
  print('===== format Date $dateFormated');
  return dateFormated;
}
