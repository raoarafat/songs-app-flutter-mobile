import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../models/songs.dart';

class SongsController extends GetxController {
  var songs = <Song>[].obs;
  var filteredSongs = <Song>[].obs;
  var selectedSong = Rxn<Song>();
  var isLoading = false.obs;

  var searchSongList = <Song>[].obs;
  var isFavourite = false.obs;

  var sortBy = ''.obs;

  final List<String> artistBanner = ['assets/images/artist_banner_1.png', 'assets/images/artist_banner_2.png', 'assets/images/artist_banner_3.jpg', 'assets/images/artist_banner_4.jpg'];
  final List<String> artistImages = ['assets/images/artist_image_1.png', 'assets/images/artist_image_2.png', 'assets/images/artist_image_3.png'];

  @override
  void onInit() {
    selectedSong(null);
    sortBy('by_rank_asc'.tr);
    loadSongs().then((value) => songs(value));
    filteredSongs(songs);
    super.onInit();
  }

  Future<List<Song>> loadSongs() async {
    isLoading(true);
    final String jsonText = await rootBundle.loadString('assets/json/songs.json');
    final List<dynamic> jsonData = (json.decode(jsonText) as Map)["songs"];
    isLoading(false);
    return jsonData.map((data) => Song.fromJson(data)).toList();
  }

  randomArtistImage() {
    Random random = Random();
    int randomNumber = random.nextInt(artistImages.length);
    return artistImages[randomNumber];
  }

  randomArtistBanner() {
    Random random = Random();
    int randomNumber = random.nextInt(artistBanner.length);
    return artistBanner[randomNumber];
  }

  sortSongs() {
    if(sortBy.value == 'by_rank_asc'.tr) {
      filteredSongs.sort((a, b) => (a.rank ?? 0).compareTo(b.rank ?? 0));
    } else if(sortBy.value == 'by_rank_desc'.tr) {
      filteredSongs.sort((a, b) => (b.rank ?? 0).compareTo(a.rank ?? 0));
    } else if(sortBy.value == 'by_title_asc'.tr) {
      filteredSongs.sort((a, b) => (a.title ?? '').compareTo(b.title ?? ''));
    } else if(sortBy.value == 'by_title_desc'.tr) {
      filteredSongs.sort((a, b) => (b.title ?? '').compareTo(a.title ?? ''));
    } else {
      filteredSongs(songs);
    }
  }

  Future<List<Song>> retrieveSearchResult(String query) async {
    if(query.isEmpty){
      searchSongList.clear();
    } else {
      searchSongList(filteredSongs.where((i) => (i.title ?? '').toLowerCase().toString().contains(query.toLowerCase())).toList());
    }
    return searchSongList;
  }
}