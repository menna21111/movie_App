import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constant/colors.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/core/widgets/loadingshimmer.dart';
import 'package:movieapp/features/movie/pres/widget/filminfodata.dart';
import 'package:movieapp/features/movie/pres/widget/overview.dart';

import '../manager/bloc/detailstv_bloc.dart';
import 'overviewtv.dart';
import 'photopostertv.dart';



class Tvdaetails extends StatelessWidget {
  const Tvdaetails({super.key, required this.tvid});
  final int tvid;

  @override
  Widget build(BuildContext context) {
    context.read<DetailstvBloc>().add(TvGETDetail( tvid));
    Screan_size.init(context);
    return Scaffold(
      body:
          BlocBuilder<DetailstvBloc, DetailstvState>(builder: (context, state) {
        if (state is TvDetailsSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Posterphotoandinfo(
                  movie: state.data,
                ),
                SizedBox(
                  height: Screan_size.hieght * .04,
                ),
             
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Overviewtv(
                      moviedetails: state.data,
                    )),
             
              
              ],
            ),
          );
        } else if (state is TvDetailsFailure) {
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
