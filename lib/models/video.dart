import 'package:flutter/material.dart';

class Video {
  final String id;
  final String title;
  final String? imageUrl;
  final int likesCount;
  final String videoUrl;
  final Map<String, dynamic> uploader;
  final String? ref;
  final bool isValid;
  final List<Map<String, dynamic>> themes;
  final List<String> subcategories;

  Video({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.likesCount,
    required this.videoUrl,
    required this.uploader,
    this.ref,
    required this.isValid,
    required this.themes,
    required this.subcategories,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'],
      likesCount: json['likesCount'] ?? 0,
      videoUrl: json['videoUrl'],
      uploader: json['uploader'] ?? {},
      ref: json['reference'],
      isValid: json['isValid'] == true,
      themes: (json['themes'] as List<dynamic>? ?? [])
          .map((t) => Map<String, dynamic>.from(t))
          .toList(),
      subcategories: (json['subcategories'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'likesCount': likesCount,
      'videoUrl': videoUrl,
      'uploader': uploader,
      'reference': ref,
      'isValid': isValid,
      'themes': themes,
      'subcategories': subcategories,
    };
  }
}

class VideoWidget extends StatelessWidget {
  final Video video;

  const VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(video.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(video.imageUrl ?? ''),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${video.likesCount} likes', style: TextStyle(color: Colors.grey)),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Action pour le bouton plus d'options
              },
            ),
          ],
        ),
      ],
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final String profilePic;

  const UserProfileWidget({Key? key, required this.profilePic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage:
          profilePic != "0"
              ? AssetImage(
                  "assets/images/profiles/profile${profilePic}.PNG",
                )
              : null,
    );
  }
}
