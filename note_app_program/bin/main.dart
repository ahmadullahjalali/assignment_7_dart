import 'dart:io';

void main() {
  List<Note> notes = [];

  while (true) {
    print('1. Add note');
    print('2. View notes');
    print('3. Search notes');
    print('4. Delete note');
    print('5. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter title:');
        String? title = stdin.readLineSync();
        print('Enter content:');
        String? content = stdin.readLineSync();
        Note note = Note(title!, content!);
        notes.add(note);
        print('Note added successfully!\n');
        break;

      case '2':
        if (notes.isEmpty) {
          print('No notes found!\n');
        } else {
          for (Note note in notes) {
            print(note);
          }
        }
        break;

      case '3':
        if (notes.isEmpty) {
          print('No notes found!\n');
        } else {
          print('Enter search keyword:');
          String? keyword = stdin.readLineSync();
          List<Note> searchResults = notes
              .where((note) =>
                  note.title.contains(keyword as Pattern) ||
                  note.content.contains(keyword as Pattern))
              .toList();
          if (searchResults.isEmpty) {
            print('No matching notes found!\n');
          } else {
            for (Note note in searchResults) {
              print(note);
            }
          }
        }
        break;

      case '4':
        if (notes.isEmpty) {
          print('No notes found!\n');
        } else {
          print('Enter note index to delete:');
          int index = int.parse(stdin.readByteSync() as String);
          if (index < 0 || index >= notes.length) {
            print('Invalid note index!\n');
          } else {
            notes.removeAt(index);
            print('Note deleted successfully!\n');
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

class Note {
  String title;
  String content;

  Note(this.title, this.content);

  @override
  String toString() {
    return 'Title: $title\nContent: $content\n';
  }
}
