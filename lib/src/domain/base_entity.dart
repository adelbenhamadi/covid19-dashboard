abstract class BaseEntity {
  String id;
  DateTime createTime;
  //var createdBy;

  BaseEntity();
  Map<String, dynamic> toMap() => {};

  @override
  bool operator ==(dynamic o) {
    if (o.runtimeType != runtimeType) {
      return false;
    }
    return o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
