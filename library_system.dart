void main() {
  // Create a new library instance
  Library library = Library();

  // Add books to the library
  library.addBook(Book(1, 'The Merchant of Venice', false));
  library.addBook(Book(2, 'Good Heart', false));
  library.addBook(Book(3, 'Five on a Treasure Island', false));

  // Add users to the library
  library.addUser(User(1, 'Monia'));
  library.addUser(User(2, 'Mohamed'));
  library.addUser(User(3, 'Ahmed'));

  // Borrow and return books for users
  library.borrowBook(1, 1);
  library.borrowBook(2, 2);
  library.borrowBook(3, 3);

  library.returnBook(1, 1);

  library.displayInfo();

  library.borrowBook(3, 2);

  // Display library info
  library.displayInfo();
}

// Book class
class Book {
  int id;
  String title;
  bool isBorrowed;

  Book(this.id, this.title, this.isBorrowed);

  // Method to display the book's info
  void displayInfo() {
    print(
        'Book ID: $id, Title: "$title", Borrowed: ${isBorrowed ? "Yes" : "No"}');
  }
}

// User class
class User {
  int id;
  String name;

  User(this.id, this.name);

  void displayInfo() {
    print('User ID: $id, Name: $name');
  }
}

// Library class
class Library {
  List<Book> books = [];
  List<User> users = [];

  // Method to add a book to the library
  void addBook(Book book) {
    books.add(book);
    print('Book "${book.title}" added to the library.');
  }

  // Method to add a user to the library
  void addUser(User user) {
    users.add(user);
    print('User "${user.name}" added to the library.');
  }

  // Method to borrow a book by a user id and book id
  void borrowBook(int bookId, int userId) {
    final book = books.firstWhere((book) => book.id == bookId);
    final user = users.firstWhere((user) => user.id == userId);

    if (book.isBorrowed) {
      print('Error: Book "${book.title}" is already borrowed by ${user.name}');
      return;
    }
    book.isBorrowed = true;
    print('Book "${book.title}" borrowed by ${user.name}.');
  }

  // Method to return a book to the library
  void returnBook(int bookId, int userId) {
    Book book = books.firstWhere((book) => book.id == bookId);
    User user = users.firstWhere((user) => user.id == userId);

    if (!book.isBorrowed) {
      print('Book ${book.title} is not borrowed by ${user.name}');
      return;
    }

    book.isBorrowed = false;
    print('Book ${book.title} has been returned by ${user.name}');
  }

  // Method to display books and user
  void displayInfo() {
    print('\n--------- Library Information ---------');
    print('\nBooks:');
    for (var book in books) {
      book.displayInfo();
    }
    print('\nUsers:');
    for (var user in users) {
      user.displayInfo();
    }
    print('--- End of Information ---\n');
  }
}
