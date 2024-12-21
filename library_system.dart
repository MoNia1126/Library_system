// Book class represents a book in the library
class Book {
  int id;
  String title;
  bool isBorrowed = false;
  // Constructor to initialize book with an ID and title
  Book(this.id, this.title);

  // Method to display the book's information
  void displayInfo() {
    print(
        'Book ID: $id, Title: "$title", Borrowed: ${isBorrowed ? "Yes" : "No"}');
  }
}

// User class represents a user who can borrow or return books
class User {
  int id;
  String name;

  User(this.id, this.name);

  void displayInfo() {
    print('User ID: $id, Name: $name');
  }
}

// Library class manages books and users
class Library {
  List<Book> books = []; // List to store books in the library
  List<User> users = []; // List to store users in the library

  // Method to add a book to the library
  void addBook(Book book) {
    books.add(book); // Add the book to the books list
    print('Book "${book.title}" added to the library.');
  }

  // Method to add a user to the library
  void addUser(User user) {
    users.add(user); // Add the user to the users list
    print('User "${user.name}" added to the library.');
  }

  // Method to borrow a book by a user
  void borrowBook(int bookId, int userId) {
    // Find the book by its ID
    final book = books.firstWhere((b) => b.id == bookId);
    // Find the user by their ID
    final user = users.firstWhere((u) => u.id == userId);

    // Check if the book and user exist
    if (book == null) {
      print(
          'Error: Book with ID $bookId not found.'); // If book not found, print error
      return;
    }
    if (user == null) {
      print(
          'Error: User with ID $userId not found.'); // If user not found, print error
      return;
    }
    if (book.isBorrowed) {
      print(
          'Error: Book "${book.title}" is already borrowed.'); // If book is already borrowed, print error
      return;
    }
    // If book is available, mark it as borrowed
    book.isBorrowed = true;
    print(
        'Book "${book.title}" borrowed by ${user.name}.'); // Print confirmation
  }

  // Method to return a book to the library
  void returnBook(int bookId) {
    // Find the book by its ID
    Book? book = books.firstWhere((b) => b.id == bookId);

    // Check if the book exists
    if (book == null) {
      print(
          'Error: Book with ID $bookId not found.'); // If book not found, print error
      return;
    }
    if (!book.isBorrowed) {
      print(
          'Error: Book "${book.title}" was not borrowed.'); // If the book wasn't borrowed, print error
      return;
    }

    // If book is borrowed, mark it as returned
    book.isBorrowed = false;
    print(
        'Book "${book.title}" returned to the library.'); // Print confirmation
  }

  // Method to display the current state of the library
  void displayInfo() {
    print('\n--- Library Information ---');
    print('\nBooks:');
    // Display all books in the library
    for (var book in books) {
      book.displayInfo();
    }
    print('\nUsers:');
    // Display all users in the library
    for (var user in users) {
      user.displayInfo();
    }
    print('--- End of Information ---\n');
  }
}

void main() {
  // Create a new library instance
  Library library = Library();

  // Add books to the library
  library.addBook(
      Book(1, 'The Merchant of Venice')); // Add book The Merchant of Venice
  library.addBook(Book(2, 'Good Heart'));
  library.addBook(Book(3, 'Five on a Treasure Island'));

  // Add users to the library
  library.addUser(User(1, 'Monia')); // Add user Alice
  library.addUser(User(2, 'Mohamed')); // Add user Bob

  // Borrow and return books for users
  library.borrowBook(1, 1); // Monia borrows "The Merchant of Venice"
  library.borrowBook(2, 2);
  library.returnBook(1);
  library.borrowBook(3, 2);

  // Display the final state of the library
  library.displayInfo();
}
