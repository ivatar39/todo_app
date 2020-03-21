import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc.dart';
import 'package:toast/toast.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: BlocListener<TodoBloc, TodoState>(
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
              return Center(child: CircularProgressIndicator());
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
