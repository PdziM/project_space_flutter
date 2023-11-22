class InstagramPostCreateFilter {
  final String accessToken;
  final String? caption;
  final String? creationId;
  final String? imageUrl;
  final String? videoUrl;
  final String? audioName;
  final String? collaborators;
  final String? children;
  final String? coverUrl;
  final String? isCarouselItem;
  final String? locationId;
  final String? mediaType;
  final String? productTags;
  final String? shareToFeed;
  final String? thumbOffset;
  final String? userTags;

  InstagramPostCreateFilter({
    required this.accessToken,
    this.creationId,
    this.caption,
    this.imageUrl,
    this.videoUrl,
    this.audioName,
    this.collaborators,
    this.children,
    this.coverUrl,
    this.isCarouselItem,
    this.locationId,
    this.mediaType,
    this.productTags,
    this.shareToFeed,
    this.thumbOffset,
    this.userTags,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'creation_id': creationId,
      'image_url': imageUrl,
      'video_url': videoUrl,
      'audio_name': audioName,
      'caption': caption,
      'collaborators': collaborators,
      'children': children,
      'cover_url': coverUrl,
      'is_carousel_item': isCarouselItem,
      'location_id': locationId,
      'media_type': mediaType,
      'product_tags': productTags,
      'share_to_feed': shareToFeed,
      'thumb_offset': thumbOffset,
      'user_tags': userTags,
    };
  }
}
