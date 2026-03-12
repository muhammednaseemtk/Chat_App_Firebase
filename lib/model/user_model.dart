class UserModel {
  final String uid;
  final String email;
  final DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.email,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      createdAt: map['createdAt']?.toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'email': email,
    'createdAt': createdAt,
  };
}