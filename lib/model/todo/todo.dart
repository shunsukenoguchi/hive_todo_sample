import 'package:hive/hive.dart';
part 'todo.g.dart'; // todo.dartの場合

@HiveType(typeId: 0) //typeIdはユニークである必要がある
class Todo extends HiveObject {
  @HiveField(0)
  //HiveFieldはクラス内でユニークである必要がある
  late String contents;
}
