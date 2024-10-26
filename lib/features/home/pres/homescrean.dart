import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constant/colors.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/features/home/pres/manager/bloc/topratedbloc/bloc/toprated_bloc.dart';
import 'package:movieapp/features/home/pres/widget/TOPRATEDNET.dart';

import '../../categries/pres/manager/bloc/getting_catg_bloc.dart';
import 'manager/bloc/UPCOMINGBLOC/homeblock_bloc.dart';
import 'widget/banner.dart';
import 'widget/categoryhome.dart';

class Homescrean extends StatelessWidget {
  const Homescrean({super.key});


  @override
  Widget build(BuildContext context) {
        context.read<GettingCatgBloc>().add(GetGenresmovie());
    context.read<TopratedBloc>().add(Gettoprated());
    Screan_size.init(context);
    return   SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
           const Banners(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:  8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('categories 🍿',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
          
                  ],
                )
              ),SizedBox(
                height: Screan_size.hieght * 0.09,
                child: const Categoryiesh()),
                 SizedBox(
                height: Screan_size.hieght * 0.01,),
                const  Padding(
                    padding: const EdgeInsets.only(left:  8.0),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('top on Netflix 🔥',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
                  ),
               
               SizedBox(
                height: Screan_size.hieght * 0.01,),
                SizedBox(
                height: Screan_size.hieght * 0.32,
                child: const Upcomov()),
            ],
          ),
        )
      
      ),
    )
    ;
  }
}