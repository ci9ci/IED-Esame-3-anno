import 'package:appterzoanno/src/core/constants.dart';
import 'package:appterzoanno/src/presentation/home/blocs/home_bloc.dart';
import 'package:appterzoanno/src/presentation/home/widgets/choicechip.dart';
import 'package:appterzoanno/src/presentation/home/widgets/navbar.dart';
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
            'images/sfondo.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
            ),
          ),
          const Navbar(), // Navbar sopra l'immagine

          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ciao ${user?.userMetadata?['user_name']},',
                                style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Come posso aiutarti?",
                                style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(194, 232, 255, 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, top: 8, bottom: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.cloud_upload,
                                size: 20.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Upload',
                                style: GoogleFonts.figtree(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ), // Aggiungi spazio tra il container e il TextField
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: const Color.fromRGBO(194, 232, 255, 1),
                      width: 2.0,
                    ),
                  ),
                  height: 150.0,
                  child: TextField(
                    controller: controller,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'In tellus urna, pretium eget rutrum in, imperdiet ac lorem. Nunc eget luctus orci, quis imperdiet nulla.',
                      hintMaxLines: 5,
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Luogo',
                  style: GoogleFonts.figtree(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Wrap(
                    children: [
                      ChipCheck(label: 'Lecce'),
                      SizedBox(width: 8.0),
                      // Ripeti i Chip aggiungendo il numero necessario
                      ChipCheck(label: 'Bari'),
                      SizedBox(width: 8.0),
                      // Ripeti i Chip aggiungendo il numero necessario
                      // ...
                    ],
                  ),
                ),
              ],
            ),
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
                      context.read<HomeCubit>().sendQuestion(controller.text);
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
    );
  }
}
