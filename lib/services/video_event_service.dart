import 'package:flutter/material.dart';

class VideoEventService {
  static final VideoEventService _instance = VideoEventService._internal();
  factory VideoEventService() => _instance;
  VideoEventService._internal();

  final ValueNotifier<Map<String, dynamic>> videoAddedNotifier = ValueNotifier({});

  void notifyVideoAdded(Map<String, dynamic> videoData) {
    videoAddedNotifier.value = videoData;
  }
}
