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

class BookModel {
  BookModel({required this.books});
  List<Book> books;

  factory BookModel.fromJson(List json) {
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
    return BookModel(books: fealtring);
  }
}
