class Book {
  Book({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.author,
    required this.description,
    required this.rate,
  });
  int id;
  String imageUrl;
  var price;
  String title;
  String author;
  String description;
  var rate;
}

class BookByIdModle {
  BookByIdModle({required this.books});
  Book books;

  factory BookByIdModle.fromJson(List json) {
    List<Book> fealtring = (json).map<Book>((value) {
      return Book(
        id: value["id"] ,
        imageUrl: value["imageUrl"] ,
        price: value["price"],
        title: value["title"],
        author: value["author"],
        description: value["description"],
        rate: value["rate"],
      );
    }).toList();
    return BookByIdModle(books: fealtring[0]);
  }
}
