import 'dart:convert';

import 'package:anime_finder/src/models/anime_entity.dart';
import 'package:http/http.dart' as http;

class AnimeRepository{

  static final _API_BASE_PATH = "https://api.jikan.moe/v3";

  Future<List<AnimeEntity>> fetchAnimes() async{
    var response = await http.get("$_API_BASE_PATH/top/anime");
    var list = (jsonDecode(response.body)['top'] as List).map((e) => new AnimeEntity().fromJson(e)).toList();
    return list;
  }
}