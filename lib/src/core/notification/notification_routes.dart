class NotificationRoutes {
  static void navigateByType(Map<String, dynamic> data) {
    final NotificationType type = NotificationType.fromId(data['id']);
    switch (type) {
      case NotificationType.message:
        // Go.to(NotificationScreen(data: data));
        break;
      case NotificationType.update:
        // Go.to(NotificationScreen(data: data));
        break;
      case NotificationType.warning:
        // Go.to(NotificationScreen(data: data));
        break;
      case NotificationType.error:
        // Go.to(NotificationScreen(data: data));
        break;
      case NotificationType.success:
        // Go.to(NotificationScreen(data: data));
        break;
      case NotificationType.infop:
        // Go.to(NotificationScreen(data: data));
        break;
      default:
        break;
    }
  }
}

enum NotificationType {
  none(0),
  message(1),
  update(2),
  warning(3),
  error(4),
  success(5),
  infop(6);

  final int id;
  const NotificationType(this.id);

  static NotificationType fromId(int id) {
    switch (id) {
      case 1:
        return NotificationType.message;
      case 2:
        return NotificationType.update;
      case 3:
        return NotificationType.warning;
      case 4:
        return NotificationType.error;
      case 5:
        return NotificationType.success;
      case 6:
        return NotificationType.infop;
      default:
        return NotificationType.none;
    }
  }
}
