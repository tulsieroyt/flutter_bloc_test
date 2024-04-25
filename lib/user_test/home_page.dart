import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/user_test/cubit/user_cubit.dart';
import 'package:flutter_bloc_test/user_test/cubit/user_cubit_state.dart';
import 'package:flutter_bloc_test/user_test/model/user_model.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserCubit>().getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User App List'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(builder: (context, state) {
        if (state is UserCubitLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserCubitError) {
          return Center(child: Text(state.message.toString()));
        } else if (state is UserCubitDataLoaded) {
          return ListView.builder(
            itemCount: state.userList.length,
            itemBuilder: (context, index) {
              UserModel user = state.userList[index];
              return ListTile(
                leading: Text(user.id.toString()),
                title: Text(user.name.toString()),
                subtitle: Text(user.email.toString()),
              );
            },
          );
        }
        return const SizedBox();
      }),
    );
  }
}
