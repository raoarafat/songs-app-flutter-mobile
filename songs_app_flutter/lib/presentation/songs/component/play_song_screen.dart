import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/extensions.dart';
import '../controller/songs_controller.dart';

class PlaySongScreen extends StatefulWidget {
  const PlaySongScreen({super.key});

  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SongsController songsController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'now_playing'.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        leading: IconButton(
          tooltip: 'back'.tr,
          icon: SvgPicture.asset(
            'assets/svgs/icon_back.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            tooltip: 'options'.tr,
            icon: SvgPicture.asset(
              'assets/svgs/icon_options.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1,
                initialPage: songsController.filteredSongs
                    .indexOf(songsController.selectedSong.value),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  songsController.selectedSong(songsController.filteredSongs[index]);
                },
              ),
              items: songsController.filteredSongs
                  .map((item) => Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.asset(
                              // item.banner ?? 'assets/images/artist_banner_1.png',
                              songsController.randomArtistBanner(),
                              fit: BoxFit.cover,
                              width: 1000.0),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songsController.selectedSong.value?.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Artist: ${songsController.selectedSong.value?.artist ?? ''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'Year: ${songsController.selectedSong.value?.year ?? ''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'Rank: ${songsController.selectedSong.value?.rank ?? ''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  8.width,
                  IconButton(
                    tooltip: 'favourite'.tr,
                    icon: songsController.isFavourite.value
                        ? const Icon(
                            Icons.favorite_rounded,
                            size: 25,
                            color: Colors.yellow,
                          )
                        : const Icon(
                            Icons.favorite_outline_rounded,
                            size: 25,
                          ),
                    onPressed: () {
                      songsController.isFavourite.value = !songsController.isFavourite.value;
                    },
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8.0),
            child: Column(
              children: [
                Image.asset('assets/images/playing_bars.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1:45',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      '4:15',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  tooltip: 'shuffle'.tr,
                  icon: SvgPicture.asset(
                    'assets/svgs/icon_shuffle.svg',
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'previous'.tr,
                      icon: SvgPicture.asset(
                        'assets/svgs/icon_previous.svg',
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color!,
                            BlendMode.srcIn),
                      ),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context)
                                .scaffoldBackgroundColor), // <-- Button color
                      ),
                      child: SvgPicture.asset(
                        'assets/svgs/icon_play.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    IconButton(
                      tooltip: 'next'.tr,
                      icon: SvgPicture.asset(
                        'assets/svgs/icon_forward.svg',
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color!,
                            BlendMode.srcIn),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                IconButton(
                  tooltip: 'replay'.tr,
                  icon: SvgPicture.asset(
                    'assets/svgs/icon_replay.svg',
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
