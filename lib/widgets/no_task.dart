import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskify/utils/app_assets.dart';
import 'package:taskify/utils/app_strings.dart';

class NoTask extends StatelessWidget {
  const NoTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                AppAssets.noData,
                height: 120,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                AppStrings.noTask,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
