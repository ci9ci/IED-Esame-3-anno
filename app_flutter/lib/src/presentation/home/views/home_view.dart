import 'package:appterzoanno/src/core/constants.dart';
import 'package:appterzoanno/src/presentation/home/blocs/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  const _HomeConnector({Key? key});

  @override
  State<_HomeConnector> createState() => _HomeConnectorState();
}

class _HomeConnectorState extends State<_HomeConnector> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/background_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ciao ${user?.userMetadata?['user_name']} 👋',
                  style: GoogleFonts.figtree(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color.fromRGBO(194, 232, 255, 1),
                  ),
                ),
                Text(
                  "Come posso aiutarti?",
                  style: GoogleFonts.figtree(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromRGBO(194, 232, 255, 1),
                  ),
                ),
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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            context
                                .read<HomeCubit>()
                                .sendQuestion(controller.text);
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ],
                    );
                  },
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeError) {
                      return Text('Error: ${state.error}');
                    }
                    if (state is HomeLoaded) {
                      return Column(
                        children: [
                          Image.network(state.answer.imageURL),
                          Text(state.answer.story),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
