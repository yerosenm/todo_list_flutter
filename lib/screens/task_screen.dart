import 'package:flutter/material.dart';
import 'package:todo_list/widgets/tasks_list.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';


class TasksScreen extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) =>
                    AddTaskScreen(),
                    );
          },
          child: const Icon(Icons.add)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                      radius: 30.0,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Todo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
