import 'package:appviagem/cubit/app_cubit_states.dart';
import 'package:appviagem/cubit/app_cubits.dart';
import 'package:appviagem/widgets/app_large_text.dart';
import 'package:appviagem/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:appviagem/misc/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is LoadedState){
            var info = state.places;
            print("--------info------");
            print(info.length);
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              //discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Descubra"),
              ),
              SizedBox(height: 20),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "Locais"),
                      Tab(text: "Inspiração"),
                      Tab(text: "Emoções"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                //image: AssetImage("images/mountain.jpeg"),
                                image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Text("Implementar em um futuro"),
                    Text("Implementar em um futuro"),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(text: "Explore more", size: 22),
                    AppText(text: "See all", color: AppColors.textColor1),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              //margin: const EdgeInsets.only(right: 50),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "images/" + images.keys.elementAt(index)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    throw UnimplementedError();
  }
}
