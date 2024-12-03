import 'package:flutter/material.dart';

void main() => runApp(const ReminderApp());

class ReminderApp extends StatelessWidget {
  const ReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  // Dummy list of reminders
  List<Map<String, dynamic>> reminders = [
    {'title': 'Buy groceries', 'completed': false},
    {'title': 'Call mom', 'completed': true},
    {'title': 'Finish project', 'completed': false},
  ];

  void toggleReminderStatus(int index) {
    setState(() {
      reminders[index]['completed'] = !reminders[index]['completed'];
    });
  }

  void addDummyReminder() {
    setState(() {
      reminders.add({'title': 'New Reminder', 'completed': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reminders'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: reminders[index]['completed'],
              onChanged: (value) {
                toggleReminderStatus(index);
              },
            ),
            title: Text(
              reminders[index]['title'],
              style: TextStyle(
                fontSize: 18,
                decoration: reminders[index]['completed']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addDummyReminder,
        child: const Icon(Icons.add),
      ),
    );
  }
}
