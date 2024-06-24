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

  static Map<int, NotificationType> _map = {
    none.id: none,
    message.id: message,
    update.id: update,
    warning.id: warning,
    error.id: error,
    success.id: success,
  };

  static NotificationType getNavigation(int id) {
    return _map[id] ?? none;
  }
}
