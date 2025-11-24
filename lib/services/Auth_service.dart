import 'package:dio/dio.dart';
import 'package:libarary/models/Auth_model.dart';

class AuthService {
  Dio dio = Dio();
  Future<AuthModel> sigin({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/Signup",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
        },
      );
      return AuthModel.fromJson(response.data);
    }
    on DioException catch(e){
    throw Exception("${e.message} ${e.requestOptions}");
    }
     on Exception catch (e) {
    throw Exception(e);
    }
  }
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignIn",
        data: {
          "email": email,
          "password": password,
        },
      );
      return AuthModel.fromJson(response.data);
    }
    on DioException catch(e){
    throw Exception("${e.message} ${e.requestOptions}");
    }
     on Exception catch (e) {
    throw Exception(e);
    }
  }
}
