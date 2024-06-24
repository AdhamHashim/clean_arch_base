part of 'notification_service.dart';

enum NotificationType {
  none(0),
  message(1),
  update(2),
  warning(3),
  error(4),
  success(5);

  final int id;
  const NotificationType(this.id);
}
