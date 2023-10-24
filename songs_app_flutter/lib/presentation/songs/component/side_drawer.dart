import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/url_constants.dart';
import '../../../utils/helper_function.dart';
import '../../../utils/theme/theme_controller.dart';
import '../../../utils/theme/theme_preferences.dart';
import '../../../utils/extensions.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Drawer(
      backgroundColor: Theme.of(context).splashColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: SvgPicture.asset(
              'assets/svgs/logo.svg',
              width: 120.0,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    dense: true,
                    horizontalTitleGap: 0.0,
                    title: Text(
                      'About',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    leading: const Icon(
                      Icons.info_outline,
                      size: 16,
                    ),
                    onTap: () {
                      HelperFunction.launchWebUrl(UrlConstants.aboutUrl);
                    },
                  ),
                  4.height,
                  Obx(
                    () => ListTile(
                      dense: true,
                      horizontalTitleGap: 0.0,
                      leading: Icon(
                        themeController.darkTheme.value
                            ? Icons.bedtime_outlined
                            : Icons.wb_sunny_outlined,
                        size: 16,
                      ),
                      title: Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      trailing: CupertinoSwitch(
                          value: themeController.darkTheme.value,
                          activeColor: Theme.of(context).splashColor,
                          onChanged: (bool value) {
                            themeController.darkTheme(value);
                            setDarkThemeStatus(themeController.darkTheme.value);
                          }),
                      onTap: () {
                        themeController
                            .darkTheme(!themeController.darkTheme.value);
                        setDarkThemeStatus(themeController.darkTheme.value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
