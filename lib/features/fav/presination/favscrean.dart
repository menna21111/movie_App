import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp/core/constant/colors.dart';
import 'package:movieapp/core/widgets/loadingshimmer.dart';
import 'package:movieapp/features/fav/data/models/moviedetails.dart';
import '../../movie/pres/MANAGER/bloc/detailsmoviebloc/moviebloc_bloc.dart';
import '../../movie/pres/filmscreanbody.dart';
import '../../movie/pres/widget/filmscrean.dart';
import 'manager/bloc/fav_bloc.dart';
import 'manager/bloc/updatebloc.dart';
import 'widget/customviewitem.dart';

class Favscrean extends StatelessWidget {
  const Favscrean({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavBloc>().add(GetFavEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblackcolor,
        title: const Text(
          'Faviortes',
          style: TextStyle(color: khomecolor, fontSize: 25,fontWeight: FontWeight.bold ),
        ),
        actions: [
          Title(color: kblackcolor, child: Image.asset('assets/logo.png')),
        ],
      ),
      body: BlocBuilder<FavBloc, FavState>(builder: (context, state) {
        if (state is Favscuess) {
          if (state.movieDetails.isEmpty) {
            return const Center(
              child: Text(
                'No Favourites yet',
                style: TextStyle(color: kwhitecolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.movieDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Filmscreanbody(id:state.movieDetails[index].id ?? 278 ,)));
                    },
                    child: CustomMovieItem(
                      movie: state.movieDetails[index],
                    ),
                  ),
                );
              },
            );
          }
        } else if (state is FavFail) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: kwhitecolor),
            ),
          );
        } else {
          return ShimmerLoading(width: 1, borderraduis: 0, height: 1);
        }
      }),
    );
  }
}
