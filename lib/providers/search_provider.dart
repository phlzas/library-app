import 'package:flutter/material.dart';
import 'package:libarary/models/book_model.dart';
import 'package:libarary/services/book_service.dart';

class SearchProvider extends ChangeNotifier {
  BookModel ?bookModelFind;
    Future find(String find) async{
    bookModelFind =await BookService().search(find);
    notifyListeners();
  }
}