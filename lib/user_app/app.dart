import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/user_app/bloc/user_bloc.dart';
import 'package:flutter_bloc_test/user_app/home_page.dart';

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
