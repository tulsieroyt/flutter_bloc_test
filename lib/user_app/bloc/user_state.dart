import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class UserState extends Equatable {}

class UserInit extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  final List<UserModel> userList;

  UserDataLoaded({required this.userList});

  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
