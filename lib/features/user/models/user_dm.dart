class UserDm {
  final int userId;
  final String fullName;
  final String userName;
  final String mobileNumber;

  UserDm({
    required this.userId,
    required this.fullName,
    required this.userName,
    required this.mobileNumber,
  });

  factory UserDm.fromJson(Map<String, dynamic> json) {
    return UserDm(
      userId: json['USERID'],
      fullName: json['FULLNAME'],
      userName: json['USERNAME'],
      mobileNumber: json['MOBILENO'],
    );
  }
}
