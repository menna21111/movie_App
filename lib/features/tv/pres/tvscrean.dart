import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constant/colors.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/features/search/pres/pres/widget/SEARCDELEGTE.dart';
import 'manager/bloc/casttv_bloc.dart';
import 'manager/bloc/nowontv_bloc.dart';
import 'widgets/categriesmainpage.dart';
import 'widgets/ontv.dart';

class Categriespage extends StatelessWidget {
  const Categriespage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NowontvBloc>().add(NowontvvEvent());
    context.read<CasttvBloc>().add(GetCasttv());
    Screan_size.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblackcolor,
        actions: [
          Title(color: kblackcolor, child: Image.asset('assets/logo.png')),
        ],
        title: const Text(
          'tv',
          style: TextStyle(
              color: khomecolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          CategoriesGrid(),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'on the air ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '🔴',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'see more',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: khomecolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
                SizedBox(height: Screan_size.hieght * 0.3, child: const Ontv()),
          )
        ],
      ),
    );
  }
}
