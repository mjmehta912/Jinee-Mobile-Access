class UserRoleDm {
  final String coName;
  final int userId;
  final int userType;
  final int cid;
  final String? secodes;
  final String? pcodes;
  final DateTime? ledgerStart;
  final DateTime? ledgerEnd;
  final bool appAccess;

  UserRoleDm({
    required this.coName,
    required this.userId,
    required this.userType,
    required this.cid,
    this.secodes,
    this.pcodes,
    this.ledgerStart,
    this.ledgerEnd,
    required this.appAccess,
  });

  factory UserRoleDm.fromJson(Map<String, dynamic> json) {
    return UserRoleDm(
      coName: json['CONAME'] ?? '',
      userId: json['USERID'] ?? 0,
      userType: json['USERTYPE'] ?? 0,
      cid: json['CID'] ?? 0,
      secodes: json['SECODEs'],
      pcodes: json['PCODEs'],
      ledgerStart: json['LedgerStart'] != null
          ? DateTime.parse(json['LedgerStart'])
          : null,
      ledgerEnd:
          json['LedgerEnd'] != null ? DateTime.parse(json['LedgerEnd']) : null,
      appAccess: json['AppAccess'] ?? false,
    );
  }
}
