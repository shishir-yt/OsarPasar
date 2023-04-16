class OsarPasarAPI {
  static var baseUrl = "http://192.168.1.71:8000/api";
  static String register = "$baseUrl/register";
  static String login = "$baseUrl/login";
  static String serviceProvider = "$baseUrl/service-providers";
  static String provinces = "$baseUrl/provinces-address";
  static String paymentCheckURL = "$baseUrl/complete-request";
  static String bookingSummary = "$baseUrl/orders/store";
  static String category = "$baseUrl/categories";
  static String notificationList = "$baseUrl/notifications/list";
  static String orderRequest = "$baseUrl/active-requests";
  static String activeBookings = "$baseUrl/active-bookings";
}
