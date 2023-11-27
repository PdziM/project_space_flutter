import 'dart:convert';

class InstagramPostMediaEntity {
  final String creationId;
  final String accessToken;
  final String audioName;
  final String caption;
  final String collaborators;
  final String children;
  final String coverUrl;
  final String imageUrl;
  final String isCarouselItem;
  final String locationId;
  final String mediaType;
  final String productTags;
  final String shareToFeed;
  final String thumbOffset;
  final String userTags;
  final String videoUrl;

  InstagramPostMediaEntity({
    required this.creationId,
    required this.accessToken,
    required this.audioName,
    required this.caption,
    required this.collaborators,
    required this.children,
    required this.coverUrl,
    required this.imageUrl,
    required this.isCarouselItem,
    required this.locationId,
    required this.mediaType,
    required this.productTags,
    required this.shareToFeed,
    required this.thumbOffset,
    required this.userTags,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'creation_id': creationId,
      'access_token': accessToken,
      'audio_name': audioName,
      'caption': caption,
      'collaborators': collaborators,
      'children': children,
      'cover_url': coverUrl,
      'image_url': imageUrl,
      'is_carousel_item': isCarouselItem,
      'location_id': locationId,
      'media_type': mediaType,
      'product_tags': productTags,
      'share_to_feed': shareToFeed,
      'thumb_offset': thumbOffset,
      'user_tags': userTags,
      'video_url': videoUrl,
    };
  }

  factory InstagramPostMediaEntity.fromMap(Map<String, dynamic> map) {
    return InstagramPostMediaEntity(
      creationId: map['creation_id'] as String,
      accessToken: map['access_token'] as String,
      audioName: map['audio_name'] as String,
      caption: map['caption'] as String,
      collaborators: map['collaborators'] as String,
      children: map['children'] as String,
      coverUrl: map['cover_url'] as String,
      imageUrl: map['image_url'] as String,
      isCarouselItem: map['is_carousel_item'] as String,
      locationId: map['location_id'] as String,
      mediaType: map['media_type'] as String,
      productTags: map['product_tags'] as String,
      shareToFeed: map['share_to_feed'] as String,
      thumbOffset: map['thumb_offset'] as String,
      userTags: map['user_tags'] as String,
      videoUrl: map['video_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstagramPostMediaEntity.fromJson(String source) =>
      InstagramPostMediaEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InstagramPostMediaEntity(creation_id: $creationId, access_token: $accessToken, audio_name: $audioName, caption: $caption, collaborators: $collaborators, children: $children, cover_url: $coverUrl, image_url: $imageUrl, is_carousel_item: $isCarouselItem, location_id: $locationId, media_type: $mediaType, product_tags: $productTags, share_to_feed: $shareToFeed, thumb_offset: $thumbOffset, user_tags: $userTags, video_url: $videoUrl)';
  }
}
