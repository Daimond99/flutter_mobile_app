import 'dart:convert';

/// Customer Login Request Model
class CustomerLoginRequest {
  final String phone;
  final String password;

  CustomerLoginRequest({
    required this.phone,
    required this.password,
  });

  factory CustomerLoginRequest.fromJson(Map<String, dynamic> json) =>
      CustomerLoginRequest(
        phone: json["phone"] ?? "",
        password: json["password"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };

  @override
  String toString() {
    return 'CustomerLoginRequest{phone: $phone}'; // Don't log password
  }
}

/// Helper functions for CustomerLoginRequest
class CustomerLoginRequestUtils {
  /// Parse JSON string to CustomerLoginRequest object
  static CustomerLoginRequest fromJsonString(String str) =>
      CustomerLoginRequest.fromJson(json.decode(str));

  /// Convert CustomerLoginRequest object to JSON string
  static String toJsonString(CustomerLoginRequest data) =>
      json.encode(data.toJson());
}