import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/extensions.dart';
import '../../../models/songs.dart';
import '../controller/songs_controller.dart';

class SongCardWidget extends StatelessWidget {
  const SongCardWidget({super.key, required this.song, this.onTap});
  final Song song;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    SongsController songsController = Get.find();
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: onTap ?? () {
          songsController.selectedSong(song);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 12),
          child: Row(
            children: [
              Image.asset(
                songsController.randomArtistImage(),
                width: 53,
                height: 52,
              ),
              8.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                      Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      song.artist ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              8.width,
              Text(
                '3:35',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              IconButton(
                tooltip: 'options'.tr,
                icon: SvgPicture.asset(
                  'assets/svgs/icon_options.svg',
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
