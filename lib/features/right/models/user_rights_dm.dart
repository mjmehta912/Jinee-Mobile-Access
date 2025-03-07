class MenuAccess {
  final int menuId;
  final String menuName;
  final bool access;

  MenuAccess({
    required this.menuId,
    required this.menuName,
    required this.access,
  });

  factory MenuAccess.fromJson(Map<String, dynamic> json) {
    return MenuAccess(
      menuId: json['MENUID'],
      menuName: json['MENUNAME'],
      access: json['Access'],
    );
  }
}

class LedgerDate {
  final String? ledgerStart;
  final String? ledgerEnd;

  LedgerDate({
    this.ledgerStart,
    this.ledgerEnd,
  });

  factory LedgerDate.fromJson(Map<String, dynamic> json) {
    return LedgerDate(
      ledgerStart: json['LedgerStart'],
      ledgerEnd: json['LedgerEnd'],
    );
  }
}

class UserAccessResponse {
  final List<MenuAccess> menuAccess;
  final List<LedgerDate> ledgerDate;

  UserAccessResponse({
    required this.menuAccess,
    required this.ledgerDate,
  });

  factory UserAccessResponse.fromJson(Map<String, dynamic> json) {
    return UserAccessResponse(
      menuAccess: (json['menuAceess'] as List)
          .map(
            (item) => MenuAccess.fromJson(item),
          )
          .toList(),
      ledgerDate: (json['ledgerDate'] as List)
          .map(
            (item) => LedgerDate.fromJson(item),
          )
          .toList(),
    );
  }
}
