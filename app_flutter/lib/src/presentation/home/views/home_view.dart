import 'package:appterzoanno/src/presentation/home/blocs/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeConnector extends StatelessWidget {
  const HomeConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const _HomeConnector(),
    );
  }
}

class _HomeConnector extends StatefulWidget {
  const _HomeConnector({super.key});

  @override
  State<_HomeConnector> createState() => _HomeConnectorState();
}

class _HomeConnectorState extends State<_HomeConnector> {
  final controller = TextEditingController();
  @override
  void initState() {
    //ifUserDoesntExist(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 90.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ciao Name'), // far prendere il nome dell'utente connesso
          const Text("Come posso aiutarti?"),
          TextField(
            controller: controller,
            onSubmitted: (text) {
              context.read<HomeCubit>().sendQuestion(text);
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return IconButton(
                onPressed: () {
                  context.read<HomeCubit>().sendQuestion(controller.text);
                },
                icon: const Icon(Icons.send),
              );
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeError) {
              return Text('Error: ${state.error}');
            }
            if (state is HomeLoaded) {
              return Text(state.answer);
            }
            return const SizedBox();
          })
        ],
      ),
    ));
  }
}
