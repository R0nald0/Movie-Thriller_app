import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:the_movie/model/Genre.dart';

class GenreCard extends StatelessWidget {
  Genre genre;
  GenreCard({Key? key, required this.genre}) : super(key: key);

  Color colorTextName(ThemeData themeData) {
    return themeData.colorScheme.onSecondary;
  }

  Color colorBoxBackgraound(ThemeData themeData) {
    return themeData.colorScheme.primaryContainer;
  }

  double fontSizeText(double size) {
    return size;
  }

  String getGenreName(Genre genre) {
    return genre.name;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final boxColor = colorBoxBackgraound(theme);
    final genreName = getGenreName(genre);
    final colorText = colorTextName(theme);
    final fontsizeText = fontSizeText(15);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: boxColor,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: Text(
          genreName,
          style: TextStyle(
              color: colorText,
              fontSize: theme.textTheme.bodyLarge?.fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
