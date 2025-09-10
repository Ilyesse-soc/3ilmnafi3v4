

// lib/services/notification_service.dart



import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showValidationNotification(bool isAccepted,
      {String? customMessage}) async {
    await flutterLocalNotificationsPlugin.show(
      1,
      isAccepted ? '🎉 Vidéo acceptée !' : '❌ Vidéo refusée',
      customMessage ??
          (isAccepted
              ? 'Votre vidéo a été validée par l’équipe admin.'
              : 'Votre vidéo a été refusée. Veuillez vérifier les critères.'),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'video_decision_channel',
          'Décision Vidéo',
          channelDescription: 'Notification pour vidéo acceptée ou refusée',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  static Future<void> showFriendRequestNotification(String targetUsername) async {
    await flutterLocalNotificationsPlugin.show(
      2,
      'Demande d\'ajout envoyée',
      'Une demande d\'ajout a été envoyée à $targetUsername.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'friend_request_channel',
          'Demande d\'ajout',
          channelDescription: 'Notification pour demande d\'ajout entre utilisateurs',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  static Future<void> showFollowNotification(String targetUsername) async {
    await flutterLocalNotificationsPlugin.show(
      3,
      'Nouvel abonné',
      '$targetUsername vous a suivi.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'follow_channel',
          'Nouveau follower',
          channelDescription: 'Notification lorsqu\'un utilisateur vous suit',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}
