import 'dart:io';

void main() {
  List<Contact> contacts = [];

  while (true) {
    print('1. Add contact');
    print('2. View all contacts');
    print('3. Search for contact');
    print('4. Delete contact');
    print('5. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter name:');
        String? name = stdin.readLineSync();
        print('Enter phone:');
        String? phone = stdin.readLineSync();
        print('Enter email:');
        String? email = stdin.readLineSync();
        Contact contact = Contact(name!, phone!, email!);
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
        if (contacts.isEmpty) {
          print('No contacts found!\n');
        } else {
          print('Enter name to search:');
          String? name = stdin.readLineSync();
          List<Contact> matchingContacts = contacts
              .where((c) => c.name.toLowerCase().contains(name!.toLowerCase()))
              .toList();
          if (matchingContacts.isEmpty) {
            print('No matching contacts found!\n');
          } else {
            for (Contact contact in matchingContacts) {
              print(contact);
            }
          }
        }
        break;

      case '4':
        if (contacts.isEmpty) {
          print('No contacts found!\n');
        } else {
          print('Enter name to delete:');
          String? name = stdin.readLineSync();
          List<Contact> matchingContacts = contacts
              .where((c) => c.name.toLowerCase() == name!.toLowerCase())
              .toList();
          if (matchingContacts.isEmpty) {
            print('No matching contacts found!\n');
          } else {
            for (Contact contact in matchingContacts) {
              contacts.remove(contact);
              print('Contact deleted successfully!\n');
            }
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

class Contact {
  String name;
  String phone;
  String email;

  Contact(this.name, this.phone, this.email);

  @override
  String toString() {
    return 'Name: $name\nPhone: $phone\nEmail: $email\n';
  }
}
