import 'dart:io';

void main() {
  List<Task> tasks = [];

  while (true) {
    print('1. Add task');
    print('2. View tasks');
    print('3. Mark task as completed');
    print('4. Delete task');
    print('5. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter task:');
        String? title = stdin.readLineSync();
        Task task = Task(title!, false);
        tasks.add(task);
        print('Task added successfully!\n');
        break;

      case '2':
        if (tasks.isEmpty) {
          print('No tasks found!\n');
        } else {
          for (Task task in tasks) {
            print(task);
          }
        }
        break;

      case '3':
        if (tasks.isEmpty) {
          print('No tasks found!\n');
        } else {
          print('Enter task index to mark as completed:');
          int index = int.parse(stdin.readLineSync() as String);
          if (index < 0 || index >= tasks.length) {
            print('Invalid task index!\n');
          } else {
            tasks[index].isCompleted = true;
            print('Task marked as completed!\n');
          }
        }
        break;

      case '4':
        if (tasks.isEmpty) {
          print('No tasks found!\n');
        } else {
          print('Enter task index to delete:');
          int index = int.parse(stdin.readLineSync() as String);
          if (index < 0 || index >= tasks.length) {
            print('Invalid task index!\n');
          } else {
            tasks.removeAt(index);
            print('Task deleted successfully!\n');
          }
        }
        break;

      case '5':
        print('Exiting program...');
        return;

      default:
        print('Invalid choice!\n');
    }
  }
}

class Task {
  String title;
  bool isCompleted;

  Task(this.title, this.isCompleted);

  @override
  String toString() {
    return '${isCompleted ? '[X]' : '[ ]'} $title';
  }
}
