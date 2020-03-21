import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc.dart';
import 'package:toast/toast.dart';
import 'package:todo_app/todo.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoError) {
          Toast.show(
            state.message,
            context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
          );
        }
      },
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is TodoLoaded) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  TextEditingController controller = TextEditingController();
                  await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration:
                                    InputDecoration(hintText: 'Введите задачу'),
                                controller: controller,
                              ),
                              RaisedButton(
                                child: Text('Добавить'),
                                onPressed: () {
                                  BlocProvider.of<TodoBloc>(context)
                                      .add(AddItem(Todo(
                                    task: controller.text,
                                    id: state.todoList.length + 1,
                                  )));
                                },
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
              body: SafeArea(
                child: ListView.separated(
                  itemCount: state.todoList.length,
                  itemBuilder: (context, index) {
                    Todo todo = state.todoList[index];
                    return Dismissible(
                      child: ListTile(
                        title: Text(
                          todo.task,
                          style: TextStyle(
                            color:
                                todo.isCompleted ? Colors.green : Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            BlocProvider.of<TodoBloc>(context).add(AddItem(Todo(
                                task: todo.task,
                                id: todo.id,
                                isCompleted: !todo.isCompleted)));
                          },
                        ),
                      ),
                      key: Key(
                        todo.id.toString(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}
