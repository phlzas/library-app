import 'package:dio/dio.dart';
import 'package:libarary/models/book_by_id_modle.dart';
import 'package:libarary/models/book_model.dart';

class BookService {
  Dio dio = Dio();
  Future<BookModel> get() async {
    try {
      Response response = await dio.get(
        "https://librarysystemflutterteam.runasp.net/api/Book/GetBooks",
      );
      return BookModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("${e.message} ${e.requestOptions}");
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
  Future<BookModel> search(String find) async {
    try {
      Response response = await dio.get(
        "https://librarysystemflutterteam.runasp.net/api/Book/GetBookByName?Bookname=$find",
      );
      return BookModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("${e.message} ${e.requestOptions}");
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
  
}
