import 'package:flutter/material.dart';

import '../colors.dart';
import '../default.dart';

class NodataView extends StatelessWidget {
  const NodataView({Key? key, required this.description, this.bgColor})
      : super(key: key);
  final String description;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    var image = const Image(
        image: AssetImage('assets/images/not_found.png'),
        width: 163,
        height: 145);

    return Container(
      color: bgColor ?? Colors.white,
      // height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  description,
                  style: DefaultStyle()
                      .t16Regular
                      .apply(color: AppColor().greyTxt),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
