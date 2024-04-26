import 'package:dio/dio.dart';
import 'package:flutter_bloc_test/user_app/model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userDataList = [];
    final Dio dio = Dio();
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        List<dynamic> rawData = response.data;
        for (var element in rawData) {
          UserModel userModel = UserModel.fromJson(element);
          userDataList.add(userModel);
        }
        return userDataList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
