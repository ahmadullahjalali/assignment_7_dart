import 'dart:io';

void main() {
  List<Contact> contacts = [];

  while (true) {
    print('1. Add contact');
    print('2. View contacts');
    print('3. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter name:');
        String? name = stdin.readLineSync();
        print('Enter phone number:');
        String? phone = stdin.readLineSync();
        Contact contact = Contact(name!, phone!);
        contacts.add(contact);
        print('Contact added successfully!\n');
        break;

      case '2':
        if (contacts.isEmpty) {
          print('No contacts found!\n');
        } else {
          for (Contact contact in contacts) {
            print(contact);
          }
        }
        break;

      case '3':
        print('Exiting program...');
        return;

      default:
        print('Invalid choice!\n');
    }
  }
}

class Contact {
  String name;
  String phone;

  Contact(this.name, this.phone);

  @override
  String toString() {
    return 'Name: $name\nPhone: $phone\n';
  }
}
