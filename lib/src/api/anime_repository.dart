import 'dart:convert';

import 'package:anime_finder/src/models/anime_entity.dart';
import 'package:http/http.dart' as http;
import 'package:anime_finder/generated/json/base/json_convert_content.dart';

class AnimeRepository{

  static final _API_BASE_PATH = "https://api.jikan.moe/v3";

  Future<List<AnimeEntity>> fetchAnimes() async{
    var response = await http.get("$_API_BASE_PATH/top/anime");
    var list = JsonConvert.fromJsonAsT<List<AnimeEntity>>((jsonDecode(response.body)['top'] as List));
    return list;
  }
}