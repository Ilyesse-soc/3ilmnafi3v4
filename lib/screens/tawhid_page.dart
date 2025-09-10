import 'dart:convert';

import 'package:_3ilm_nafi3/constants.dart';
import 'package:_3ilm_nafi3/models/uploader.dart';
import 'package:_3ilm_nafi3/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:_3ilm_nafi3/services/video_event_service.dart';

import '../models/video.dart';

class TawhidPage extends StatefulWidget {
  const TawhidPage({super.key});

  @override
  State<TawhidPage> createState() => _TawhidPageState();
}

class _TawhidPageState extends State<TawhidPage> {
  // ...existing code...
  // Aucun contenu par défaut, la page reste vide jusqu'à ce que l'utilisateur ajoute une vidéo via upload_page.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Center(
              child: Text(
                "Aucune catégorie disponible pour le moment.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.orange, size: 35),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
    );
  }
}
