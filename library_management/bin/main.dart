import 'dart:io';

void main() {
  List<Book> books = [
    Book('The Alchemist', 'Paulo Coelho', 5),
    Book('To Kill a Mockingbird', 'Harper Lee', 3),
    Book('Pride and Prejudice', 'Jane Austen', 2),
    Book('1984', 'George Orwell', 4),
    Book('The Great Gatsby', 'F. Scott Fitzgerald', 1),
  ];

  while (true) {
    print('1. Add book');
    print('2. View all books');
    print('3. Search for book');
    print('4. Borrow book');
    print('5. Return book');
    print('6. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter title:');
        String? title = stdin.readLineSync();
        print('Enter author:');
        String? author = stdin.readLineSync();
        print('Enter copies:');
        int copies = int.parse(stdin.readLineSync() as String);
        Book book = Book(title!, author!, copies);
        books.add(book);
        print('Book added successfully!\n');
        break;

      case '2':
        if (books.isEmpty) {
          print('No books found!\n');
        } else {
          for (Book book in books) {
            print(book);
          }
        }
        break;

      case '3':
        if (books.isEmpty) {
          print('No books found!\n');
        } else {
          print('Enter title to search:');
          String? title = stdin.readLineSync();
          List<Book> matchingBooks = books
              .where(
                  (b) => b.title.toLowerCase().contains(title!.toLowerCase()))
              .toList();
          if (matchingBooks.isEmpty) {
            print('No matching books found!\n');
          } else {
            for (Book book in matchingBooks) {
              print(book);
            }
          }
        }
        break;

      case '4':
        if (books.isEmpty) {
          print('No books found!\n');
        } else {
          print('Enter title to borrow:');
          String? title = stdin.readLineSync();
          List<Book> matchingBooks = books
              .where((b) => b.title.toLowerCase() == title!.toLowerCase())
              .toList();
          if (matchingBooks.isEmpty) {
            print('No matching books found!\n');
          } else {
            Book book = matchingBooks[0];
            if (book.copies > 0) {
              book.copies--;
              print('Book borrowed successfully!\n');
            } else {
              print('All copies of this book are currently borrowed!\n');
            }
          }
        }
        break;

      case '5':
        if (books.isEmpty) {
          print('No books found!\n');
        } else {
          print('Enter title to return:');
          String? title = stdin.readLineSync();
          List<Book> matchingBooks = books
              .where((b) => b.title.toLowerCase() == title!.toLowerCase())
              .toList();
          if (matchingBooks.isEmpty) {
            print('No matching books found!\n');
          } else {
            Book book = matchingBooks[0];
            book.copies++;
            print('Book returned successfully!\n');
          }
        }
        break;

      case '6':
        print('Exiting program...');
        return;

      default:
        print('Invalid choice!\n');
    }
  }
}

class Book {
  String title;
  String author;
  int copies;

  Book(this.title, this.author, this.copies);

  @override
  String toString() {
    return 'Title: $title\nAuthor: $author\nCopies: $copies\n';
  }
}
