class InstagramPostMediaModel {
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

  InstagramPostMediaModel.fromJson(json)
      : creationId = json['creation_id'],
        accessToken = json['access_token'],
        audioName = json['audio_name'],
        caption = json['caption'],
        collaborators = json['collaborators'],
        children = json['children'],
        coverUrl = json['cover_url'],
        imageUrl = json['image_url'],
        isCarouselItem = json['is_carousel_item'],
        locationId = json['location_id'],
        mediaType = json['media_type'],
        productTags = json['product_tags'],
        shareToFeed = json['share_to_feed'],
        thumbOffset = json['thumb_offset'],
        userTags = json['user_tags'],
        videoUrl = json['video_url'];
}
