// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel with ChangeNotifier {
  BlogModel({
    this.id,
    this.siteId,
    this.author,
    this.date,
    this.modified,
    this.title,
    this.url,
    this.shortUrl,
    this.content,
    this.excerpt,
    this.slug,
    this.guid,
    this.status,
    this.sticky,
    this.password,
    this.parent,
    this.type,
    this.discussion,
    this.likesEnabled,
    this.sharingEnabled,
    this.likeCount,
    this.iLike,
    this.isReblogged,
    this.isFollowing,
    this.globalId,
    this.featuredImage,
    this.postThumbnail,
    this.format,
    this.geo,
    this.menuOrder,
    this.pageTemplate,
    this.publicizeUrLs,
    this.terms,
    this.tags,
    this.categories,
    this.attachments,
    this.attachmentCount,
    this.metadata,
    this.meta,
    this.capabilities,
    this.otherUrLs,
  });

  int? id;
  int? siteId;
  Author? author;
  DateTime? date;
  DateTime? modified;
  String? title;
  String? url;
  String? shortUrl;
  String? content;
  String? excerpt;
  String? slug;
  String? guid;
  String? status;
  bool? sticky;
  String? password;
  bool? parent;
  String? type;
  Discussion? discussion;
  bool? likesEnabled;
  bool? sharingEnabled;
  int? likeCount;
  bool? iLike;
  bool? isReblogged;
  bool? isFollowing;
  String? globalId;
  String? featuredImage;
  PostThumbnail? postThumbnail;
  String? format;
  bool? geo;
  int? menuOrder;
  String? pageTemplate;
  List<dynamic>? publicizeUrLs;
  Terms? terms;
  OtherUrLs? tags;
  Categor? categories;
  Attachments? attachments;
  int? attachmentCount;
  List<Metadatum>? metadata;
  BlogModelMeta? meta;
  Capabilities? capabilities;
  OtherUrLs? otherUrLs;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["ID"],
        siteId: json["site_ID"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
        title: json["title"],
        url: json["URL"],
        shortUrl: json["short_URL"],
        content: json["content"],
        excerpt: json["excerpt"],
        slug: json["slug"],
        guid: json["guid"],
        status: json["status"],
        sticky: json["sticky"],
        password: json["password"],
        parent: json["parent"],
        type: json["type"],
        discussion: json["discussion"] == null ? null : Discussion.fromJson(json["discussion"]),
        likesEnabled: json["likes_enabled"],
        sharingEnabled: json["sharing_enabled"],
        likeCount: json["like_count"],
        iLike: json["i_like"],
        isReblogged: json["is_reblogged"],
        isFollowing: json["is_following"],
        globalId: json["global_ID"],
        featuredImage: json["featured_image"],
        postThumbnail: json["post_thumbnail"] == null ? null : PostThumbnail.fromJson(json["post_thumbnail"]),
        format: json["format"],
        geo: json["geo"],
        menuOrder: json["menu_order"],
        pageTemplate: json["page_template"],
        publicizeUrLs: json["publicize_URLs"] == null ? null : List<dynamic>.from(json["publicize_URLs"].map((x) => x)),
        terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
        tags: json["tags"] == null ? null : OtherUrLs.fromJson(json["tags"]),
        categories: json["categories"] == null ? null : Categor.fromJson(json["categories"]),
        attachments: json["attachments"] == null ? null : Attachments.fromJson(json["attachments"]),
        attachmentCount: json["attachment_count"],
        metadata:
            json["metadata"] == null ? null : List<Metadatum>.from(json["metadata"].map((x) => Metadatum.fromJson(x))),
        meta: json["meta"] == null ? null : BlogModelMeta.fromJson(json["meta"]),
        capabilities: json["capabilities"] == null ? null : Capabilities.fromJson(json["capabilities"]),
        otherUrLs: json["other_URLs"] == null ? null : OtherUrLs.fromJson(json["other_URLs"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "site_ID": siteId,
        "author": author?.toJson(),
        "date": date?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "title": title,
        "URL": url,
        "short_URL": shortUrl,
        "content": content,
        "excerpt": excerpt,
        "slug": slug,
        "guid": guid,
        "status": status,
        "sticky": sticky,
        "password": password,
        "parent": parent,
        "type": type,
        "discussion": discussion?.toJson(),
        "likes_enabled": likesEnabled,
        "sharing_enabled": sharingEnabled,
        "like_count": likeCount,
        "i_like": iLike,
        "is_reblogged": isReblogged,
        "is_following": isFollowing,
        "global_ID": globalId,
        "featured_image": featuredImage,
        "post_thumbnail": postThumbnail?.toJson(),
        "format": format,
        "geo": geo,
        "menu_order": menuOrder,
        "page_template": pageTemplate,
        "publicize_URLs": publicizeUrLs == null ? null : List<dynamic>.from(publicizeUrLs!.map((x) => x)),
        "terms": terms?.toJson(),
        "tags": tags?.toJson(),
        "categories": categories?.toJson(),
        "attachments": attachments?.toJson(),
        "attachment_count": attachmentCount,
        "metadata": metadata == null ? null : List<dynamic>.from(metadata!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
        "capabilities": capabilities?.toJson(),
        "other_URLs": otherUrLs?.toJson(),
      };
}

class Attachments {
  Attachments({
    this.the46185,
  });

  The46185? the46185;

  factory Attachments.fromJson(Map<String, dynamic> json) => Attachments(
        the46185: json["46185"] == null ? null : The46185.fromJson(json["46185"]),
      );

  Map<String, dynamic> toJson() => {
        "46185": the46185?.toJson(),
      };
}

class The46185 {
  The46185({
    this.id,
    this.url,
    this.guid,
    this.date,
    this.postId,
    this.authorId,
    this.file,
    this.mimeType,
    this.extension,
    this.title,
    this.caption,
    this.description,
    this.alt,
    this.thumbnails,
    this.height,
    this.width,
    this.exif,
    this.meta,
  });

  int? id;
  String? url;
  String? guid;
  DateTime? date;
  int? postId;
  int? authorId;
  String? file;
  String? mimeType;
  String? extension;
  String? title;
  String? caption;
  String? description;
  String? alt;
  Thumbnails? thumbnails;
  int? height;
  int? width;
  Exif? exif;
  The46185Meta? meta;

  factory The46185.fromJson(Map<String, dynamic> json) => The46185(
        id: json["ID"],
        url: json["URL"],
        guid: json["guid"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        postId: json["post_ID"],
        authorId: json["author_ID"],
        file: json["file"],
        mimeType: json["mime_type"],
        extension: json["extension"],
        title: json["title"],
        caption: json["caption"],
        description: json["description"],
        alt: json["alt"],
        thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
        height: json["height"],
        width: json["width"],
        exif: json["exif"] == null ? null : Exif.fromJson(json["exif"]),
        meta: json["meta"] == null ? null : The46185Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "URL": url,
        "guid": guid,
        "date": date?.toIso8601String(),
        "post_ID": postId,
        "author_ID": authorId,
        "file": file,
        "mime_type": mimeType,
        "extension": extension,
        "title": title,
        "caption": caption,
        "description": description,
        "alt": alt,
        "thumbnails": thumbnails?.toJson(),
        "height": height,
        "width": width,
        "exif": exif?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Exif {
  Exif({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: json["keywords"] == null ? null : List<dynamic>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": keywords == null ? null : List<dynamic>.from(keywords!.map((x) => x)),
      };
}

class The46185Meta {
  The46185Meta({
    this.links,
  });

  PurpleLinks? links;

  factory The46185Meta.fromJson(Map<String, dynamic> json) => The46185Meta(
        links: json["links"] == null ? null : PurpleLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "links": links?.toJson(),
      };
}

class PurpleLinks {
  PurpleLinks({
    this.self,
    this.help,
    this.site,
    this.parent,
  });

  String? self;
  String? help;
  String? site;
  String? parent;

  factory PurpleLinks.fromJson(Map<String, dynamic> json) => PurpleLinks(
        self: json["self"],
        help: json["help"],
        site: json["site"],
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "help": help,
        "site": site,
        "parent": parent,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnail,
    this.medium,
    this.large,
    this.newspackArticleBlockLandscapeLarge,
    this.newspackArticleBlockPortraitLarge,
    this.newspackArticleBlockSquareLarge,
    this.newspackArticleBlockLandscapeMedium,
    this.newspackArticleBlockPortraitMedium,
    this.newspackArticleBlockSquareMedium,
    this.newspackArticleBlockLandscapeSmall,
    this.newspackArticleBlockPortraitSmall,
    this.newspackArticleBlockSquareSmall,
    this.newspackArticleBlockLandscapeTiny,
    this.newspackArticleBlockPortraitTiny,
    this.newspackArticleBlockSquareTiny,
    this.newspackArticleBlockUncropped,
  });

  String? thumbnail;
  String? medium;
  String? large;
  String? newspackArticleBlockLandscapeLarge;
  String? newspackArticleBlockPortraitLarge;
  String? newspackArticleBlockSquareLarge;
  String? newspackArticleBlockLandscapeMedium;
  String? newspackArticleBlockPortraitMedium;
  String? newspackArticleBlockSquareMedium;
  String? newspackArticleBlockLandscapeSmall;
  String? newspackArticleBlockPortraitSmall;
  String? newspackArticleBlockSquareSmall;
  String? newspackArticleBlockLandscapeTiny;
  String? newspackArticleBlockPortraitTiny;
  String? newspackArticleBlockSquareTiny;
  String? newspackArticleBlockUncropped;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnail: json["thumbnail"],
        medium: json["medium"],
        large: json["large"],
        newspackArticleBlockLandscapeLarge: json["newspack-article-block-landscape-large"],
        newspackArticleBlockPortraitLarge: json["newspack-article-block-portrait-large"],
        newspackArticleBlockSquareLarge: json["newspack-article-block-square-large"],
        newspackArticleBlockLandscapeMedium: json["newspack-article-block-landscape-medium"],
        newspackArticleBlockPortraitMedium: json["newspack-article-block-portrait-medium"],
        newspackArticleBlockSquareMedium: json["newspack-article-block-square-medium"],
        newspackArticleBlockLandscapeSmall: json["newspack-article-block-landscape-small"],
        newspackArticleBlockPortraitSmall: json["newspack-article-block-portrait-small"],
        newspackArticleBlockSquareSmall: json["newspack-article-block-square-small"],
        newspackArticleBlockLandscapeTiny: json["newspack-article-block-landscape-tiny"],
        newspackArticleBlockPortraitTiny: json["newspack-article-block-portrait-tiny"],
        newspackArticleBlockSquareTiny: json["newspack-article-block-square-tiny"],
        newspackArticleBlockUncropped: json["newspack-article-block-uncropped"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "medium": medium,
        "large": large,
        "newspack-article-block-landscape-large": newspackArticleBlockLandscapeLarge,
        "newspack-article-block-portrait-large": newspackArticleBlockPortraitLarge,
        "newspack-article-block-square-large": newspackArticleBlockSquareLarge,
        "newspack-article-block-landscape-medium": newspackArticleBlockLandscapeMedium,
        "newspack-article-block-portrait-medium": newspackArticleBlockPortraitMedium,
        "newspack-article-block-square-medium": newspackArticleBlockSquareMedium,
        "newspack-article-block-landscape-small": newspackArticleBlockLandscapeSmall,
        "newspack-article-block-portrait-small": newspackArticleBlockPortraitSmall,
        "newspack-article-block-square-small": newspackArticleBlockSquareSmall,
        "newspack-article-block-landscape-tiny": newspackArticleBlockLandscapeTiny,
        "newspack-article-block-portrait-tiny": newspackArticleBlockPortraitTiny,
        "newspack-article-block-square-tiny": newspackArticleBlockSquareTiny,
        "newspack-article-block-uncropped": newspackArticleBlockUncropped,
      };
}

class Author {
  Author({
    this.id,
    this.login,
    this.email,
    this.name,
    this.firstName,
    this.lastName,
    this.niceName,
    this.url,
    this.avatarUrl,
    this.profileUrl,
    this.siteId,
  });

  int? id;
  String? login;
  bool? email;
  String? name;
  String? firstName;
  String? lastName;
  String? niceName;
  String? url;
  String? avatarUrl;
  String? profileUrl;
  int? siteId;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["ID"],
        login: json["login"],
        email: json["email"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        niceName: json["nice_name"],
        url: json["URL"],
        avatarUrl: json["avatar_URL"],
        profileUrl: json["profile_URL"],
        siteId: json["site_ID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "login": login,
        "email": email,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "nice_name": niceName,
        "URL": url,
        "avatar_URL": avatarUrl,
        "profile_URL": profileUrl,
        "site_ID": siteId,
      };
}

class Capabilities {
  Capabilities({
    this.publishPost,
    this.deletePost,
    this.editPost,
  });

  bool? publishPost;
  bool? deletePost;
  bool? editPost;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
        publishPost: json["publish_post"],
        deletePost: json["delete_post"],
        editPost: json["edit_post"],
      );

  Map<String, dynamic> toJson() => {
        "publish_post": publishPost,
        "delete_post": deletePost,
        "edit_post": editPost,
      };
}

class Categor {
  Categor({
    this.adminBar,
  });

  AdminBar? adminBar;

  factory Categor.fromJson(Map<String, dynamic> json) => Categor(
        adminBar: json["Admin Bar"] == null ? null : AdminBar.fromJson(json["Admin Bar"]),
      );

  Map<String, dynamic> toJson() => {
        "Admin Bar": adminBar?.toJson(),
      };
}

class AdminBar {
  AdminBar({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.postCount,
    this.parent,
    this.meta,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  int? postCount;
  int? parent;
  The46185Meta? meta;

  factory AdminBar.fromJson(Map<String, dynamic> json) => AdminBar(
        id: json["ID"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        postCount: json["post_count"],
        parent: json["parent"],
        meta: json["meta"] == null ? null : The46185Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "slug": slug,
        "description": description,
        "post_count": postCount,
        "parent": parent,
        "meta": meta?.toJson(),
      };
}

class Discussion {
  Discussion({
    this.commentsOpen,
    this.commentStatus,
    this.pingsOpen,
    this.pingStatus,
    this.commentCount,
  });

  bool? commentsOpen;
  String? commentStatus;
  bool? pingsOpen;
  String? pingStatus;
  int? commentCount;

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        commentsOpen: json["comments_open"],
        commentStatus: json["comment_status"],
        pingsOpen: json["pings_open"],
        pingStatus: json["ping_status"],
        commentCount: json["comment_count"],
      );

  Map<String, dynamic> toJson() => {
        "comments_open": commentsOpen,
        "comment_status": commentStatus,
        "pings_open": pingsOpen,
        "ping_status": pingStatus,
        "comment_count": commentCount,
      };
}

class BlogModelMeta {
  BlogModelMeta({
    this.links,
  });

  FluffyLinks? links;

  factory BlogModelMeta.fromJson(Map<String, dynamic> json) => BlogModelMeta(
        links: FluffyLinks?.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "links": links?.toJson(),
      };
}

class FluffyLinks {
  FluffyLinks({
    this.self,
    this.help,
    this.site,
    this.replies,
    this.likes,
  });

  String? self;
  String? help;
  String? site;
  String? replies;
  String? likes;

  factory FluffyLinks.fromJson(Map<String, dynamic> json) => FluffyLinks(
        self: json["self"],
        help: json["help"],
        site: json["site"],
        replies: json["replies"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "help": help,
        "site": site,
        "replies": replies,
        "likes": likes,
      };
}

class Metadatum {
  Metadatum({
    this.id,
    this.key,
    this.value,
  });

  String? id;
  String? key;
  String? value;

  factory Metadatum.fromJson(Map<String, dynamic> json) => Metadatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

class OtherUrLs {
  OtherUrLs();

  factory OtherUrLs.fromJson(Map<String, dynamic> json) => OtherUrLs();

  Map<String, dynamic> toJson() => {};
}

class PostThumbnail {
  PostThumbnail({
    this.id,
    this.url,
    this.guid,
    this.mimeType,
    this.width,
    this.height,
  });

  int? id;
  String? url;
  String? guid;
  String? mimeType;
  int? width;
  int? height;

  factory PostThumbnail.fromJson(Map<String, dynamic> json) => PostThumbnail(
        id: json["ID"],
        url: json["URL"],
        guid: json["guid"],
        mimeType: json["mime_type"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "URL": url,
        "guid": guid,
        "mime_type": mimeType,
        "width": width,
        "height": height,
      };
}

class Terms {
  Terms({
    this.category,
    this.postTag,
    this.postFormat,
    this.mentions,
  });

  Categor? category;
  OtherUrLs? postTag;
  OtherUrLs? postFormat;
  OtherUrLs? mentions;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        category: json["category"] == null ? null : Categor.fromJson(json["category"]),
        postTag: json["post_tag"] == null ? null : OtherUrLs.fromJson(json["post_tag"]),
        postFormat: json["post_format"] == null ? null : OtherUrLs.fromJson(json["post_format"]),
        mentions: json["mentions"] == null ? null : OtherUrLs.fromJson(json["mentions"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
        "post_tag": postTag?.toJson(),
        "post_format": postFormat?.toJson(),
        "mentions": mentions?.toJson(),
      };
}
