import 'package:flutter/material.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/core/widgets/cachedimage.dart';
import 'package:movieapp/features/movie/data/models/moviedetails.dart';
import 'package:movieapp/features/movie/pres/widget/filminfodata.dart';

import '../../../../core/constant/colors.dart';

class Posterphotoandinfo extends StatelessWidget {
  final MovieDetails movie;
  const Posterphotoandinfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Stack(clipBehavior: Clip.none, children: [
      SizedBox(
        height: Screan_size.hieght * .4,
        child: Stack(fit: StackFit.expand, children: [
          Cachedimage(
              imageUrl: movie.backdropPath ?? '',
              height: 0,
              width: 0,
              borderraduis: 0),
      
          AbsorbPointer(
            absorbing: true,
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          )  , 
        ]),
      ), Positioned(
              top: Screan_size.hieght * .05,
              left: Screan_size.width * .01,
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: kwhitecolor, size: 35),
                  onPressed: () {
                    print('pressed');
                    Navigator.pop(context);
                    print('pressed');
                  })),
      Positioned(
          top: Screan_size.hieght * .18,
          left: Screan_size.width * .06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Hero(
                transitionOnUserGestures: false, // Disable reverse animation

                tag: "",
                child: Container(
                  height: Screan_size.hieght * .23,
                  width: Screan_size.width * .27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Cachedimage(
                      imageUrl: movie.posterPath ?? '',
                      height: 0,
                      width: 0,
                      borderraduis: .04),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Filminfodata(
                movie: movie,
              )
            ],
          )),
    ]);
  }
}
