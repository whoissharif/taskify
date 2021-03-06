import 'package:flutter/material.dart';
import '../utils/app_strings.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Center(child: Text(AppStrings.loadingText)),
    ));
  }
}
