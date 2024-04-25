import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc_test/counter/cubit/counter_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Cubit App'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (state is CounterValueUpdated)
                ? Text(state.counter.toString())
                : const Text('0'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().counterIncreased();
                  },
                  child: const Icon(Icons.minimize),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().counterDecreased();
                  },
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
