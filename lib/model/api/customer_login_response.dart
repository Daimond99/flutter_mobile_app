import 'dart:convert';

/// Customer Login Response Model
class CustomerLoginResponse {
  final String message;
  final Customer customer;

  CustomerLoginResponse({
    required this.message,
    required this.customer,
  });

  factory CustomerLoginResponse.fromJson(Map<String, dynamic> json) =>
      CustomerLoginResponse(
        message: json["message"] ?? "",
        customer: Customer.fromJson(json["customer"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "customer": customer.toJson(),
      };

  @override
  String toString() {
    return 'CustomerLoginResponse{message: $message, customer: $customer}';
  }
}

/// Customer Model
class Customer {
  final int idx;
  final String fullname;
  final String phone;
  final String email;
  final String image;

  Customer({
    required this.idx,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.image,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        idx: json["idx"] ?? 0,
        fullname: json["fullname"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idx": idx,
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "image": image,
      };

  @override
  String toString() {
    return 'Customer{idx: $idx, fullname: $fullname, phone: $phone, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Customer && other.idx == idx;
  }

  @override
  int get hashCode => idx.hashCode;
}

/// Helper functions for CustomerLoginResponse
class CustomerLoginResponseUtils {
  /// Parse JSON string to CustomerLoginResponse object
  static CustomerLoginResponse fromJsonString(String str) =>
      CustomerLoginResponse.fromJson(json.decode(str));

  /// Convert CustomerLoginResponse object to JSON string
  static String toJsonString(CustomerLoginResponse data) =>
      json.encode(data.toJson());
}