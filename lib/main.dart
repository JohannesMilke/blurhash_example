import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'BlurHash Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              /// Generate hashes with https://blurha.sh
              // L35;~?IVD\$s;.AoIM_fk9Zt7t7WB
              // L84_@YNYQ*v|-tNZZ|xFTKNZi^s=
              BlurHash(hash: 'L35;~?IVD\$s;.AoIM_fk9Zt7t7WB'),
              buildCover(),
            ],
          ),
        ),
      );

  Widget buildCover() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(),
          buildSong(),
        ],
      );

  Widget buildSong() => Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1 / 1,

              // child:  BlurHash(hash: 'L84_@YNYQ*v|-tNZZ|xFTKNZi^s='),
              child: Image.network(
                'https://images.unsplash.com/photo-1599488615731-7e5c2823ff28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            const SizedBox(height: 80),
            Text(
              'Swimming In the Ocean',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent diam magna, ultricies.',
              style: GoogleFonts.lato(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget buildAppBar() => Container(
        height: 56,
        child: Row(
          children: [
            IconButton(
              onPressed: () {/* NOOP */},
              icon: Icon(Icons.expand_more, color: Colors.white),
            ),
            Expanded(
              child: Text(
                'My Playlist',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            IconButton(
              onPressed: () {/* NOOP */},
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      );
}
