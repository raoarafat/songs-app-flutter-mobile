import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/songs.dart';
import '../controller/songs_controller.dart';
import 'play_song_screen.dart';
import 'song_card.dart';

class SongsSearchDelegate extends SearchDelegate {
  SongsController songsController = Get.find();


  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isNotEmpty) {
              query = '';
            } else {
              close(context, null);
            }
          },
          tooltip: 'Clear',
          splashRadius: 20,
          icon: const Icon(
            Icons.highlight_remove_outlined,
          ),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        tooltip: 'back'.tr,
        icon: SvgPicture.asset(
          'assets/svgs/icon_back.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!, BlendMode.srcIn),
        ),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => FutureBuilder<List<Song>>(
    future: songsController.retrieveSearchResult(query),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }else {
        if(snapshot.data != null && snapshot.data!.isNotEmpty){
          return buildSuggestionSuccess(snapshot.data!);
        }else{
          return Center(
            child: Text(
              query.isEmpty ? 'Type something to search' : 'No result found',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        }
      }
    },
  );

  Widget buildSuggestionSuccess(List<Song> suggestion) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        var data = suggestion[index];
        return SongCardWidget(song: data, onTap: () {
          FocusScope.of(context).unfocus();
          songsController.selectedSong(data);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const PlaySongScreen()));
        },);
      }
  );
}
