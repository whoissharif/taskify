import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key, this.mobile, this.tab}) : super(key: key);

  final Widget? mobile;
  final Widget? tab;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 768) {
        return mobile!;
      } else {
        return tab!;
      }
    });
  }
}
