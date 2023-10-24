// To parse this JSON data, do
//
//     final songs = songsFromJson(jsonString);

import 'dart:convert';

SongsResponse songsFromJson(String str) => SongsResponse.fromJson(json.decode(str));

String songsToJson(SongsResponse data) => json.encode(data.toJson());

class SongsResponse {
  List<Song>? songs;

  SongsResponse({
    this.songs,
  });

  factory SongsResponse.fromJson(Map<String, dynamic> json) => SongsResponse(
    songs: json['songs'] == null ? [] : List<Song>.from(json['songs']!.map((x) => Song.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'songs': songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toJson())),
  };
}

class Song {
  int? rank;
  String? title;
  String? artist;
  String? album;
  String? year;
  String? image;
  String? banner;

  Song({
    this.rank,
    this.title,
    this.artist,
    this.album,
    this.year,
    this.image,
    this.banner,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    rank: json['rank'],
    title: json['title'],
    artist: json['artist'],
    album: json['album'],
    year: json['year'],
    image: json['image'],
    banner: json['banner'],
  );

  Map<String, dynamic> toJson() => {
    'rank': rank,
    'title': title,
    'artist': artist,
    'album': album,
    'year': year,
    'image': image,
    'banner': banner,
  };
}
