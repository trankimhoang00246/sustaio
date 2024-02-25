class CollabRequestService {
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String description;
  final int collabId;

  CollabRequestService({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.description,
    required this.collabId,
  });
  factory CollabRequestService.fromJson(Map<String, dynamic> json) {
    return CollabRequestService(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      collabId: json['collabId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'description': description,
      'collabId': collabId,
    };
  }
}
