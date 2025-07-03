class BeeModel {
  final int? a;
  final int? b;
  final String? c;
  final bool? d;
  final List<UserListModel>? userList;

  BeeModel({this.a, this.b, this.c, this.d, this.userList});

  factory BeeModel.fromJson(Map<String, dynamic> json) {
    List<UserListModel> userList = [];
    if (json['userList'] is List) {
      for (var item in json['userList']) {
        userList.add(UserListModel.fromJson(item));
      }
    }
    return BeeModel(
      a: int.tryParse('${json['a']}'),
      b: int.tryParse('${json['b']}'),
      c: json['c'] as String?,
      d: bool.tryParse('${json['d']}'),
      userList: userList,
    );
  }
}

// ===========================================================================

class UserListModel {
  final int? id;
  final String? name;

  UserListModel({this.id, this.name});

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      id: int.tryParse('${json['id']}'),
      name: json['name'] as String?,
    );
  }
}
