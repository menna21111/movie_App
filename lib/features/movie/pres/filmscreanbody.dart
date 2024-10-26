import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'MANAGER/bloc/cast/bloc/cast_bloc.dart';
import 'MANAGER/bloc/detailsmoviebloc/moviebloc_bloc.dart';
import 'MANAGER/bloc/similarmovie/bloc/similiar_bloc.dart';
import 'widget/filmscrean.dart';

class Filmscreanbody extends StatelessWidget {
  const Filmscreanbody({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    context
        .read<MovieblocBloc>()
        .add(MovIEGETDetail(id));
    context
        .read<CastBloc>()
        .add(MovIEGETCast(id));
    context
        .read<SimiliarBloc>()
        .add(MovIEGETsimilar(id));
    return Filmscrean();
  }
}
