import 'package:flutter/material.dart';
import 'package:libarary/utils/my_card.dart';
import 'package:provider/provider.dart';

Widget circularLoader({double size = 24, Color color = Colors.blue}) {
  return SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(color: color, strokeWidth: 2.5),
  );
}

class BookDetails extends StatelessWidget {
  int id;
  String title;
  String imageUrl;
  String description;
  String author;
  String price;
  String rate;
  BookDetails({super.key, required this.id , required this.author, required this.description, required this.imageUrl, required this.price, required this.rate, required this.title });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: MyCard(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.network(
                          imageUrl,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.book);
                          },
                        ),
                      ),
                      Text(title),
                      Text(description),
                      Text(author),
                      Text("\$ ${price.toString()}"),
                      Text(rate.toString()),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
