import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/user_app/bloc/user_event.dart';
import 'package:flutter_bloc_test/user_app/bloc/user_state.dart';
import 'package:flutter_bloc_test/user_app/service/api_service.dart';

import '../model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> userList = [];
  final ApiService _apiService = ApiService();

  UserBloc() : super(UserInit()) {
    on<GetAllUserList>((event, emit) async {
      try {
        emit(UserLoading());
        userList = await _apiService.getData();
        emit(UserDataLoaded(userList: userList));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
