import 'package:anime_finder/generated/json/base/json_convert_content.dart';
import 'package:anime_finder/generated/json/base/json_field.dart';
import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable with JsonConvert<AnimeEntity> {
  @JSONField(name: "mal_id")
  int malId;
  int rank;
  String title;
  String url;
  @JSONField(name: "image_url")
  String imageUrl;
  String type;
  int episodes;
  @JSONField(name: "start_date")
  String startDate;
  @JSONField(name: "end_date")
  String endDate;
  int members;
  double score;

  @override
  List<Object> get props => [
        malId,
        rank,
        title,
        url,
        imageUrl,
        type,
        episodes,
        startDate,
        endDate,
        members,
        score
      ];

  @override
  bool get stringify => true;
}
