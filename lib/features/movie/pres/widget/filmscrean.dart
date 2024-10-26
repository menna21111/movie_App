import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constant/colors.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/core/widgets/loadingshimmer.dart';
import 'package:movieapp/features/movie/pres/widget/filminfodata.dart';
import 'package:movieapp/features/movie/pres/widget/overview.dart';

import '../MANAGER/bloc/detailsmoviebloc/moviebloc_bloc.dart';
import '../MANAGER/bloc/videobloc/bloc/video_bloc.dart';
import 'cast.dart';
import 'favpart.dart';
import 'filminfo.dart';
import 'posterphotoandinfo.dart';
import 'similarmovie.dart';
import 'video.dart';

class Filmscrean extends StatelessWidget {
  const Filmscrean({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Scaffold(
      body:
          BlocBuilder<MovieblocBloc, MovieblocState>(builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Posterphotoandinfo(
                  movie: state.data,
                ),
                SizedBox(
                  height: Screan_size.hieght * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<VideoBloc>()
                            .add(MovIdisplayvidao(state.data.id ?? 278));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Video();
                        }));
                      },
                      child: Container(
                        // height: Screan_size.hieght * .075,
                        padding: const EdgeInsets.all(5),
                        width: Screan_size.width * .71,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: khhomecolor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle,
                              size: 40,
                              color: kwhitecolor,
                            ),
                            Text(
                              '  play video',
                              style: TextStyle(
                                color: kwhitecolor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                    
                    ),
                    Favpart(
                      movie: state.data,
                    ), const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Overview(
                      moviedetails: state.data,
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cast',
                      style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      SizedBox(height: Screan_size.hieght * .3, child: Cast()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'similar movies',
                      style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: Screan_size.hieght * .3, child: Similarmovie()),
                )
              ],
            ),
          );
        } else if (state is MovieDetailsFailure) {
          return Center(
            child: Text(
              state.failure.errMessage,
              style: const TextStyle(color: kwhitecolor),
            ),
          );
        } else {
          return ShimmerLoading(
            width: 1,
            borderraduis: 0,
            height: 1,
          );
        }
      }),
    );
  }
}
