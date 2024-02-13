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
      extendBody: true,
      bottomNavigationBar: const Navbar(),
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
          ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 90.0,
              left: 16.0,
              right: 16.0,
              bottom: 160,
            ),
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
                          right: 16,
                          left: 16,
                          top: 8,
                          bottom: 8,
                        ),
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
                        'In tellus urna, pretium eget rutrum in, imperdiet ac lorem. Nunc eget luctus o...',
                    hintMaxLines: 5,
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
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
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ChipCheck(label: 'Lecce'),
                    ChipCheck(label: 'Bari'),
                    ChipCheck(label: 'Brindisi'),
                    ChipCheck(label: 'Ostuni'),
                    ChipCheck(label: 'Gallipoli'),
                    ChipCheck(label: 'Polignano a Mare'),
                    ChipCheck(label: 'Monopoli'),
                    ChipCheck(label: 'Altamura'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              const SizedBox(height: 16.0),
              Text(
                'Genere',
                style: GoogleFonts.figtree(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ChipCheck(label: 'Action'),
                    ChipCheck(label: 'Adventure'),
                    ChipCheck(label: 'Animation'),
                    ChipCheck(label: 'War'),
                    ChipCheck(label: 'Historical'),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeError) {
                    return Text('Error: ${state.error}');
                  }
                  if (state is HomeLoaded) {
                    return Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/sfondo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.only(
                            right: 32, left: 32, bottom: 80),
                        children: [
                          Text(
                            "Immagine Generata",
                            style: GoogleFonts.figtree(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: const Color.fromRGBO(194, 232, 255, 1),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                state.answer.imageURL,
                                width: 400,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(),
                          //Image.network(state.answer.imageURL),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 32, right: 32),
                            child: Text(
                              state.answer.story,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(194, 232, 255, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Altezza del gradiente inferiore
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 32 + kBottomNavigationBarHeight,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        backgroundColor: const Color(0xFFC2E8FF),
                        padding: const EdgeInsets.all(16)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.view_in_ar,
                          size: 24.0,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'AR Map',
                          style: GoogleFonts.figtree(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().sendQuestion(controller.text);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: const Color.fromRGBO(82, 154, 210, 1),
                        padding: const EdgeInsets.all(16)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.lens_blur,
                          size: 24.0,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'Genera',
                          style: GoogleFonts.figtree(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
