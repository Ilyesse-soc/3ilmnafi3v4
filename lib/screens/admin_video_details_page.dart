import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/video.dart';

class AdminVideoDetailsPage extends StatefulWidget {
  final Video video;

  const AdminVideoDetailsPage({super.key, required this.video});

  @override
  State<AdminVideoDetailsPage> createState() => _AdminVideoDetailsPageState();
}

class _AdminVideoDetailsPageState extends State<AdminVideoDetailsPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      "https://3ilmnafi3.digilocx.fr/uploads/${widget.video.videoUrl.split("/")[4]}"
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;

    final themes = video.themes.map((t) => t['name']).join(", ");
    final subcategories = video.subcategories?.join(", ") ?? "—";

    return Scaffold(
      appBar: AppBar(title: Text("🧐 Détails de la vidéo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📌 Titre :", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(video.title),
            SizedBox(height: 12),

           /* if (video.description != null) ...[
              Text("📝 Description :", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(video.description!),
              SizedBox(height: 12),
            ],*/

            Text("🗂️ Thèmes :", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(themes),
            SizedBox(height: 12),

            Text("🔖 Sous-catégories :", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(subcategories),
            SizedBox(height: 12),

            /*if (video.author != null) ...[
              Text("👤 Intervenant :", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(video.author!),
              SizedBox(height: 12),
            ],*/

            Text("🖼️ Image & Vidéo :", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            if (video.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(video.imageUrl!),
              ),
            SizedBox(height: 16),

            if (_controller.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        size: 64,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
