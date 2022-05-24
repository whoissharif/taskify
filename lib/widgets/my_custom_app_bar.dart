import 'package:flutter/material.dart';
import 'package:taskify/utils/app_assets.dart';
import 'package:taskify/utils/app_strings.dart';
import 'package:taskify/utils/app_text_styles.dart';

import '../features/search/custom_search_deligate.dart';
import '../features/todo/controllers/todo_controller.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key? key,
    required this.todoProvider,
  }) : super(key: key);

  final TodoController todoProvider;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          showSearch(
              context: context, delegate: CustomSearchDelegate(todoProvider));
        },
        icon: const Icon(
          Icons.search,
          color: Colors.red,
          size: 30,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text(
          AppStrings.appName,
          style: AppTextStyle.logoTextStyle,
        ),
        background: Stack(
          children: [
            Image.asset(
              AppAssets.bgStars,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Image.asset(
                AppAssets.appLogo,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
      expandedHeight: 200,
    );
  }
}
