import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/user_test/cubit/user_cubit.dart';
import 'package:flutter_bloc_test/user_test/service/api_service.dart';

import 'home_page.dart';

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(apiService: ApiService()))
      ],
      child: const MaterialApp(
        home: UserHomePage(),
      ),
    );
  }
}
