import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/extensions.dart';
import 'component/play_song_screen.dart';
import 'component/side_drawer.dart';
import 'component/song_card.dart';
import 'component/songs_search_delegate.dart';
import 'component/sort_filter_bottom_sheet.dart';
import 'controller/songs_controller.dart';

class SongsListingScreen extends StatefulWidget {
  const SongsListingScreen({super.key});

  @override
  State<SongsListingScreen> createState() => _SongsListingScreenState();
}

class _SongsListingScreenState extends State<SongsListingScreen> {
  var songsController = Get.put(SongsController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const SideDrawer(),
      appBar: AppBar(
        title: Text(
          'app_name'.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            tooltip: 'search'.tr,
            icon: SvgPicture.asset(
              'assets/svgs/icon_search.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
            onPressed: () {
              showSearch(context: context, delegate: SongsSearchDelegate());
            },
          ),
          IconButton(
            tooltip: 'filter'.tr,
            icon: SvgPicture.asset(
              'assets/svgs/icon_filter.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context) =>
                  const SortFilterBottomSheet(),
                backgroundColor: Colors.transparent, isScrollControlled: true,);
            },
          ),
          IconButton(
            tooltip: 'menu'.tr,
            icon: SvgPicture.asset(
              'assets/svgs/icon_menu.svg',
              width: 20,
              height: 14,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          ),
        ],
      ),
      body: Obx(
        () => songsController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Stack(
                children: [
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      primary: true,
                      itemCount: songsController.filteredSongs.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = songsController.filteredSongs[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  index == (songsController.filteredSongs.length - 1)
                                      ? 100.0
                                      : 0.0),
                          child: SongCardWidget(song: data),
                        );
                      }),
                  Obx(
                    () => songsController.selectedSong.value == null
                        ? const SizedBox()
                        : Positioned(
                            left: 10,
                            right: 10,
                            bottom: 5,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  elevation: 8,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const PlaySongScreen()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 12),
                                      child: Column(
                                        children: [
                                          LinearProgressIndicator(
                                            value: 0.7,
                                            backgroundColor: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            semanticsLabel:
                                                'Linear progress indicator',
                                          ),
                                          4.height,
                                          Row(
                                            children: [
                                              Image.asset(
                                                songsController.randomArtistImage(),
                                                width: 52,
                                                height: 52,
                                              ),
                                              8.width,
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      songsController
                                                              .selectedSong
                                                              .value
                                                              ?.title ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                    ),
                                                    Text(
                                                      songsController
                                                              .selectedSong
                                                              .value
                                                              ?.artist ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              8.width,
                                              IconButton(
                                                tooltip: 'play'.tr,
                                                icon: SvgPicture.asset(
                                                  'assets/svgs/icon_pause.svg',
                                                  width: 25,
                                                  height: 25,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -20,
                                  top: -20,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      songsController.selectedSong.value = null;
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      backgroundColor: MaterialStateProperty
                                          .all(Theme.of(context)
                                              .scaffoldBackgroundColor), // <-- Button color
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
