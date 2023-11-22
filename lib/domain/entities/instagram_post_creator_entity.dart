import 'dart:convert';

import '../../data/models/instagram_post_creator_model.dart';

class InstagramPostCreatorEntity {
  final String id;

  InstagramPostCreatorEntity({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory InstagramPostCreatorEntity.fromMap(Map<String, dynamic> map) {
    return InstagramPostCreatorEntity(
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstagramPostCreatorEntity.fromJson(String source) =>
      InstagramPostCreatorEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'InstagramPostCreatorEntity(id: $id)';

  factory InstagramPostCreatorEntity.fromModel(
      InstagramPostCreatorModel model) {
    return InstagramPostCreatorEntity(id: model.id);
  }
}
