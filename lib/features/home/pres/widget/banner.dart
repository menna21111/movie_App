import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constant/colors.dart';
import 'package:movieapp/core/constant/size.dart';
import 'package:movieapp/core/widgets/imob.dart';
import 'package:movieapp/features/movie/pres/filmscreanbody.dart';

import '../../../../core/utls/api/url.dart';
import '../../../../core/widgets/loadingshimmer.dart';
import '../../data/models/movieresponsemodel.dart';
import '../manager/bloc/UPCOMINGBLOC/homeblock_bloc.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeblockBloc, HomeblockState>(
      builder: (context, state) {
        if (state is Scucessupcoming) {
          final items = state.upcoming.results.take(5).toList();
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .42,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items:
                      items.map((movie) => Bannerphoto(movie: movie)).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    autoPlay: true,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    pageSnapping: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1400),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DotsIndicator(
                  dotsCount: items.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: khomecolor,
                    size: Size(10.0, 5.0),
                    activeSize: Size(28.0, 6.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    spacing: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
              ),
            ],
          );
        } else if (state is Failureupcoming) {
          return Center(
            child: Text(state.failure.errMessage),
          );

        }else{
          return ShimmerLoading(height: .42,width: 1,borderraduis: .01,);
        }
      },
    );
  }
}

class Bannerphoto extends StatelessWidget {
  const Bannerphoto({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => Filmscreanbody(id: movie.id??278)));
      },
      child: Stack(
        children: [
          Container(
              height: Screan_size.hieght * 0.42,
              width: double.infinity,
              decoration:  const BoxDecoration(
                  color: kblackcolor,
                )
                 , child:CachedNetworkImage(imageUrl:  '${URL.imageUrl}${movie.backdropPath}', fit: BoxFit.fill,
                 placeholder: (context, url) => ShimmerLoading(height: .42,width: 1,borderraduis: .01,),
                 errorWidget: (context, url, error) => ShimmerLoading(height: .42,width: 1,borderraduis: .01,),
                 ),
                  ),
          Positioned(
          
              left: Screan_size.width * .01,
              child: Container(
                  height: Screan_size.hieght * 0.1,
                  width: Screan_size.width * 0.1,
                  decoration:  const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/netflix.png',
                    ),
                  )))),
          Positioned(
              bottom: Screan_size.hieght * .015,
              left: Screan_size.width * .018,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title??'',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                  
                    children: [
                   const Imob()
                     ,SizedBox(width: 10,),
                      Text(
                        movie.voteAverage.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
              bottom: Screan_size.hieght * .016,
              right: Screan_size.width * .019,
              child: CircleAvatar(
                radius: Screan_size.hieght * .03,
                backgroundColor: khomecolor,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
              )),
        ],
      ),
    );
  }
}
