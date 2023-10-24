import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/extensions.dart';
import '../songs/songs_listing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/logo.svg',
            width: 250.0,
            fit: BoxFit.cover,
          ),
          22.height,
          Text(
            'unlock_the_rhythm_of_life'.tr,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white),
          ),
          200.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SongsListingScreen()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // <-- Radius
                ),
                minimumSize: const Size.fromHeight(58),
              ),
              child: Text(
                'get_started'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).splashColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
