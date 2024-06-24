part of 'notification_service.dart';

class NotificationRoutes {
  static void navigateByType(Map<String, dynamic> data) {
    final int id = data['id'];
    final navigation = NotificationNavigationFactory.getNavigation(id);
    navigation.navigate(data: data);
  }
}

class NotificationNavigationFactory {
  static final Map<int, NotificationNavigation> _navigations = {
    NotificationType.message.id: MessageNavigation(),
    NotificationType.update.id: UpdateNavigation(),
    // Add other mappings...
  };

  static NotificationNavigation getNavigation(int id) {
    return _navigations[id] ?? HomeNavigation();
  }
}

abstract class NotificationNavigation {
  void navigate({required Map<String, dynamic> data});
}

class HomeNavigation implements NotificationNavigation {
  @override
  void navigate({required Map<String, dynamic> data}) {
    // Navigate to message screen with logic
  }
}

class MessageNavigation implements NotificationNavigation {
  @override
  void navigate({required Map<String, dynamic> data}) {
    // Navigate to message screen with logic
  }
}

class UpdateNavigation implements NotificationNavigation {
  @override
  void navigate({required Map<String, dynamic> data}) {
    // Navigate to update screen
  }
}
