import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constant/colors.dart';
import '../../../fav/data/models/moviedetails.dart';
import '../../data/models/moviedetails.dart';

class Favpart extends StatefulWidget {
  final MovieDetails movie;
  const Favpart({super.key, required this.movie});

  @override
  State<Favpart> createState() => _FavpartState();
}

class _FavpartState extends State<Favpart> {

  bool isFavorite = false;
  @override
  void initState() {
    
    super.initState();
      checkIfFavorite();
  }

  void checkIfFavorite() async {
    final box = await Hive.openBox<MovieDetailss>('movieBox');
    bool found = false;

    for (var movie in box.values.cast<MovieDetailss>()) {
      if (movie.id == widget.movie.id) {
        found = true;
        break;
      }
    }

    setState(() {
      isFavorite = found;
    });
  }

  void toggleFavorite(MovieDetailss movieDetail) async {
    final box = await Hive.openBox<MovieDetailss>('movieBox');
    
    if (isFavorite) {
    await box.delete(movieDetail.id.toString());
      setState(() {
        isFavorite = false;
      });
    } else {
      await box.put(movieDetail.id.toString(), movieDetail);
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleFavorite(widget.movie.toHiveModel());
        
      },
      child: CircleAvatar(
        radius: 23,
        backgroundColor: khomecolor,
        child: Icon(
            isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
          color: kwhitecolor,
          size: 36,
        ),
      ),
    );
  }
}
