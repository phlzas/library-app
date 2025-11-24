import 'package:flutter/material.dart';
import 'package:libarary/pages/book_details.dart';
import 'package:libarary/providers/book_provider.dart';
import 'package:libarary/utils/my_card.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

Widget circularLoader({double size = 24, Color color = Colors.blue}) {
  return SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(color: color, strokeWidth: 2.5),
  );
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = context.read<BookProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/search");
          },
          icon: Icon(Icons.search),
        ),
        title: Text("Book Store"),
      ),
      body: Consumer<BookProvider>(
        builder: (_, __, _) {
          if (pro.bookModel == null) {
            pro.get();
            return Center(child: circularLoader());
          } else {
            return ListView.builder(
              itemCount: pro.bookModel!.books.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetails(
                          id: pro.bookModel!.books[index].id,
                          author: pro.bookModel!.books[index].author,
                          description: pro.bookModel!.books[index].description,
                          price: pro.bookModel!.books[index].price.toString(),
                          imageUrl: pro.bookModel!.books[index].imageUrl,
                          rate: pro.bookModel!.books[index].rate.toString(),
                          title: pro.bookModel!.books[index].title,
                        ),
                      ),
                    );
                  },
                  child: MyCard(
                    child: ListTile(
                      leading: Image.network(
                        "${pro.bookModel!.books[index].imageUrl}",
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.book);
                        },
                      ),
                      title: Text(pro.bookModel!.books[index].title),
                      subtitle: Text(
                       "\$ ${ pro.bookModel!.books[index].price.toString()}",
                      ),
                      trailing: Text(
                        pro.bookModel!.books[index].rate.toString(),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
