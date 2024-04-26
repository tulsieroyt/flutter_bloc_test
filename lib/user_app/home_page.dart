import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/user_app/bloc/user_bloc.dart';
import 'package:flutter_bloc_test/user_app/bloc/user_event.dart';
import 'package:flutter_bloc_test/user_app/bloc/user_state.dart';

import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetAllUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        } else if (state is UserDataLoaded) {
          return _view(context, state.userList);
        }
        return Container();
      }),
    );
  }

  Widget _view(BuildContext context, List<UserModel> userModelList) {
    const titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    return ListView.builder(
      itemCount: userModelList.length,
      itemBuilder: (context, index) {
        final user = userModelList[index];
        return ListTile(
          leading: Text(user.id.toString()),
          title: Text(
            user.name.toString(),
            style: titleStyle,
          ),
          subtitle: Text(user.email.toString()),
        );
      },
    );
  }
}
