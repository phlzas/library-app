import 'package:flutter/material.dart';
import 'package:libarary/pages/book_details.dart';
import 'package:libarary/providers/book_provider.dart';
import 'package:libarary/providers/search_provider.dart';
import 'package:libarary/utils/my_card.dart';
import 'package:libarary/utils/my_searchFeild.dart';
import 'package:libarary/utils/my_snackbar.dart';
import 'package:provider/provider.dart';



class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final pro = context.read<SearchProvider>();
    String ?t;
    return Scaffold(
      appBar: AppBar(
        title: MySearchField(
          controller: searchController,
          hint: "enter your title",
          onClear: () async{
          if(searchController.text.isNotEmpty){
            await pro.find(searchController.text);
            t = searchController.text;
            searchController.clear();
            }
            else{
            showMySnackBar(context, "enter something",  backgroundColor: Colors.red);
            }
          },
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (_, __, _) {
          if (t == "" || t == null  || pro.bookModelFind == null) {
            return Center(child: Text("searching..."));
          } else {
            return ListView.builder(
              itemCount: pro.bookModelFind!.books.length,
              itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (_) => BookDetails(
                          id: pro.bookModelFind!.books[index].id,
                          author: pro.bookModelFind!.books[index].author,
                          description: pro.bookModelFind!.books[index].description,
                          price: pro.bookModelFind!.books[index].price.toString(),
                          imageUrl: pro.bookModelFind!.books[index].imageUrl,
                          rate: pro.bookModelFind!.books[index].rate.toString(),
                          title: pro.bookModelFind!.books[index].title,
                        ),
                      ),
                      );
                    },
                    child: MyCard(
                      child: ListTile(
                        leading: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.network(
                            "${pro.bookModelFind!.books[index].imageUrl}",
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.book);
                            },
                          ),
                        ),
                        title: Text(pro.bookModelFind!.books[index].title),
                        subtitle: Text(
                          "\$ ${ pro.bookModelFind!.books[index].price.toString()}",
                        ),
                        trailing: Text(
                          pro.bookModelFind!.books[index].rate.toString(),
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
