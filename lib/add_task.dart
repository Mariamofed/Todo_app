import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();
final TextEditingController taskNamecontroller = TextEditingController();
final TextEditingController taskDescriptioncontroller = TextEditingController();

class _AddTaskState extends State<AddTask> {
  bool _isHighPriority = false;

  static final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty<Icon?>.fromMap({
        WidgetState.selected: Icon(Icons.check),
        WidgetState.any: Icon(
          Icons.close,
          color: const Color.fromARGB(255, 44, 123, 163),
        ),
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'New Task',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please Enter Your Task Name";
                    }
                    return null;
                  },
                  controller: taskNamecontroller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Finish UI design for login screen',
                    hintStyle: TextStyle(color: Color(0xFF6D6D6D)),
                    filled: true,
                    fillColor: Color(0xFF282828),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Task Description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please Enter Your Task Description";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  controller: taskDescriptioncontroller,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
                    hintStyle: TextStyle(color: Color(0xFF6D6D6D)),
                    filled: true,
                    fillColor: Color(0xFF282828),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'High Priority',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Switch(
                      value: _isHighPriority,
                      thumbIcon: thumbIcon,
                      // inactiveThumbColor: const Color.fromARGB(255, 13, 74, 105),
                      activeThumbColor: Colors.lightGreenAccent,
                      thumbColor: WidgetStatePropertyAll<Color>(Colors.white),
                      onChanged: (bool value) {
                        setState(() {
                          _isHighPriority = value;
                        });
                      },
                    ),
                  ],
                ),
                // Spacer(),
                SizedBox(height: 97),
                Align(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {}
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15B86C),
                      fixedSize: Size(370, 40),
                      padding: EdgeInsets.zero,
                    ),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          "Add Task",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
