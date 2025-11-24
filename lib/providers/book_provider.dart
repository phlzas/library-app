import 'package:flutter/material.dart';
import 'package:libarary/models/book_model.dart';
import 'package:libarary/services/book_service.dart';

class BookProvider extends ChangeNotifier {
  BookModel ?bookModel;
  Future get() async{
  bookModel =await BookService().get();
    notifyListeners();
  }

}