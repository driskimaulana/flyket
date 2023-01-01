class Notification {
  int id;
  String topic;
  String title;
  String message;
  bool isRead;
  String createdAt;

  Notification(
      {required this.id,
      required this.topic,
      required this.title,
      required this.message,
      required this.isRead,
      required this.createdAt});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
        id: json['id'],
        topic: json['topic'],
        title: json['title'],
        message: json['message'],
        isRead: json['is_read'],
        createdAt: json['createdAt']);
  }
}
