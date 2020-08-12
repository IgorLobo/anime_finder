import 'package:anime_finder/src/models/anime_entity.dart';

animeEntityFromJson(AnimeEntity data, Map<String, dynamic> json) {
	if (json['mal_id'] != null) {
		data.malId = json['mal_id']?.toInt();
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['image_url'] != null) {
		data.imageUrl = json['image_url']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['episodes'] != null) {
		data.episodes = json['episodes']?.toInt();
	}
	if (json['start_date'] != null) {
		data.startDate = json['start_date']?.toString();
	}
	if (json['end_date'] != null) {
		data.endDate = json['end_date']?.toString();
	}
	if (json['members'] != null) {
		data.members = json['members']?.toInt();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toDouble();
	}
	return data;
}

Map<String, dynamic> animeEntityToJson(AnimeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mal_id'] = entity.malId;
	data['rank'] = entity.rank;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['image_url'] = entity.imageUrl;
	data['type'] = entity.type;
	data['episodes'] = entity.episodes;
	data['start_date'] = entity.startDate;
	data['end_date'] = entity.endDate;
	data['members'] = entity.members;
	data['score'] = entity.score;
	return data;
}