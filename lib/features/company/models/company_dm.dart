class CompanyDm {
  final int cid;
  final String coName;
  final int coCode;
  final String databaseName;
  final int serverId;

  CompanyDm({
    required this.cid,
    required this.coName,
    required this.coCode,
    required this.databaseName,
    required this.serverId,
  });

  factory CompanyDm.fromJson(Map<String, dynamic> json) {
    return CompanyDm(
      cid: json['CID'],
      coName: json['CONAME'],
      coCode: json['COCODE'],
      databaseName: json['DatabaseName'],
      serverId: json['ServerId'],
    );
  }
}
