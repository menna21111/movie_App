import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/constant/colors.dart';
import '../../../tv/pres/tvscrean.dart';
import '../../../categries/pres/manager/bloc/getting_catg_bloc.dart';
import '../../../fav/presination/favscrean.dart';
import '../../../fav/presination/manager/bloc/fav_bloc.dart';
import '../../../search/pres/pres/searchscrean.dart';
import '../homescrean.dart';
import '../manager/bloc/UPCOMINGBLOC/homeblock_bloc.dart';
import '../manager/bloc/popular/bloc/populars_bloc.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigation> {
  int _selectedTab = 0;
  List<Widget> _pages = [];
  List<IconData> _listOfIcons = [];

  @override
  void initState() {


    super.initState();

    _initializePagesAndIcons();

    context.read<HomeblockBloc>().add(Getupcoming());
    context.read<PopularsBloc>().add(Getpopular());


    // context.read<HomeblockBloc>().add(Gettoprated());
  }


  void _initializePagesAndIcons() {
    _pages = [
      const   Homescrean(),
      const Categriespage(),  const Searchscrean(),
    Favscrean(),
      
    ];
    _listOfIcons = [Icons.home,
      Icons.radio,
       Icons.search,
      Icons.favorite_border,
     
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: _pages[_selectedTab],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 5),
        height: size.width * .162,
        decoration: BoxDecoration(
          color: kblackcolor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListView.builder(
          itemCount: _listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              _changeTab(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == _selectedTab ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == _selectedTab ? size.width * .014 : 0,
                    decoration: const BoxDecoration(
                      color: khomecolor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    _listOfIcons[index],
                    size: size.width * .076,
                    color: index == _selectedTab ? khomecolor : kgreycolor,
                  ),
                  SizedBox(height: size.width * .028),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
