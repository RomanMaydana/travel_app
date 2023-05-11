import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/travel.dart';

import '../widget/travel_card.dart';
import '../widget/travel_navigation_bar.dart';
import 'place_detail_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.star)),
        ],
      ),
      body: ListView.builder(
        itemCount: TravelPlace.travelPlaces.length,
        itemExtent: 350,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight + 20),
        itemBuilder: (_, index) {
          final place = TravelPlace.travelPlaces[index];
          return Hero(
            tag: place.id,
            child: Material(
              child: TravelCard(
                place: place,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, animation, __) => FadeTransition(
                          opacity: animation,
                          child: PlaceDetailScreen(
                              place: place,
                              screenHeight: MediaQuery.of(context).size.height),
                        ),
                      ));
                },
              ),
            ),
          );
        },
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_on),
      ),
      bottomNavigationBar: TravelNavigationBar(
        onTap: (index) {},
        items: [
          TravelNavigationBarItem(
              icon: CupertinoIcons.chat_bubble,
              selectIcon: CupertinoIcons.chat_bubble_fill),
          TravelNavigationBarItem(
              icon: CupertinoIcons.square_split_2x2,
              selectIcon: CupertinoIcons.square_split_2x2_fill),
        ],
      ),
    );
  }
}
