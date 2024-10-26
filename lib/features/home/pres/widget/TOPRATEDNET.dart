import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/core/widgets/cachedimage.dart';
import 'package:movieapp/features/movie/pres/widget/filmscrean.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/imob.dart';
import '../../../../core/widgets/loadingshimmer.dart';
import '../../../movie/pres/MANAGER/bloc/cast/bloc/cast_bloc.dart';
import '../../../movie/pres/MANAGER/bloc/detailsmoviebloc/moviebloc_bloc.dart';
import '../../../movie/pres/MANAGER/bloc/similarmovie/bloc/similiar_bloc.dart';
import '../../../movie/pres/filmscreanbody.dart';
import '../manager/bloc/UPCOMINGBLOC/homeblock_bloc.dart';
import '../manager/bloc/topratedbloc/bloc/toprated_bloc.dart';

class Upcomov extends StatelessWidget {
  const Upcomov({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocBuilder<TopratedBloc, TopratedState>(builder: (context, state) {
      if (state is Scucesstoprated) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return  Filmscreanbody( id:  state.top.results[index].id??278,);
                    }));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Screan_size.hieght * .22,
                        width: Screan_size.width * .5,
                        decoration: BoxDecoration(
                          color: kgreycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Cachedimage(
                            imageUrl:
                                state.top.results[index].backdropPath ?? '',
                            height: .19,
                            width: .3,
                            borderraduis: .027),
                      ),
                      Text(
                        state.top.results[index].title ?? '',
                        style: TextStyle(color: kwhitecolor),
                      ),
                      Row(
                        children: [
                          Imob(),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            state.top.results[index].voteAverage.toString(),
                            style: TextStyle(color: kwhitecolor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      } else if (state is Failuretoprated) {
        return SizedBox(
          child: Center(
            child: Text(state.failure.errMessage),
          ),
        );
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ShimmerLoading(
                width: Screan_size.width * .1,
                borderraduis: Screan_size.width * .0002,
              ),
            );
          },
        );
      }
    });
  }
}
