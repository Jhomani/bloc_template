import 'dart:io';
import './request.dart';

class Todo {
  int? id;
  int userId = 0;
  String title = '';
  bool completed = false;

  Todo({
    this.id,
    required this.userId,
    required this.title,
    required this.completed
  });

  // Todo.fromMap(Map<String, dynamic> todo) {
  //   id = todo['id'];
  //   userId = todo['userId'] ?? 0;
  //   title = todo['title'] ?? '';
  //   completed = todo['completed'] ?? false;
  // }
}

class Todo2 {
  final int id;
  final String title;
  final bool completed;

  Todo2({
    required this.id,
    required this.title,
    required this.completed,
  });
}

// class PagedListData<T>{
//   ItemCreator<T> creator;

//   PagedListData(ItemCreator<T> this.creator) {}

//   T performMagic() {
//     T item = creator();

//     return item; 
//   }
// }


Todo todoCreator(Map<String, dynamic> todo) => Todo(
  id: todo['id'],
  userId: todo['userId'],
  title: todo['title'],
  completed: todo['completed']
);

class LoginModel{
  String user = '';
  String password = '';

  LoginModel({
    required this.user,
    required this.password,
  });

  factory LoginModel.fromJSON(Map<String, dynamic> map) => LoginModel(
    user: map['user'],
    password: map['password'],
  );

  Map<String, dynamic> toObject() => ({
    'user': user,
    'password': password,
  });
}

Future<bool> hasConnection() async {
  var resp = false;

  try {
    final result = await InternetAddress.lookup('example.com');

    print(result);

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }

  } on SocketException catch (_) {
    print('not connected');
  }

  return resp;
}


void main() async {
  var request2 = ClientRequest<Todo>(endpoint: '/posts', creator: todoCreator); 
  // request2.creator = todoCreator;
  // request2.endpoint = '/todos';

  // print(await request2.find());

  // var request = ClientRequest(); 

  const data = {"title": "Tu eres la ostia","completed": false, "userId": 99};

  Todo? createdTodo = await request2.post(data); 

  // print(await hasConnection());
  print(createdTodo);
}


