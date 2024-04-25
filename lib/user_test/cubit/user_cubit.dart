import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/user_test/cubit/user_cubit_state.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiService apiService;

  UserCubit({required this.apiService}) : super(UserCubitInit());

  void getUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();
      emit(UserCubitDataLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
