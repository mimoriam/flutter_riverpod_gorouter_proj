import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  Todo({
    required this.id,
    required this.desc,
    this.completed = false,
  });

  final String id;
  final String desc;
  final bool completed;
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]): super(initialTodos ?? []);

  void add(String id, String desc) {
    state = [
      ...state,
      Todo(
        id: id,
        desc: desc
      )
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            desc: todo.desc,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}