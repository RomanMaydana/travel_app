import 'package:flutter/material.dart';

import '../../data/travel.dart';
import '../widget/animated_detail_header.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    super.key,
    required this.place,
    required this.screenHeight,
  });

  final TravelPlace place;
  final double screenHeight;
  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late ScrollController _controller;
  late ValueNotifier<double> bottomPercentNotifier;
  bool isScrolling = false;
  void _scrollListener() {
    final percent =
        _controller.position.pixels / MediaQuery.of(context).size.height;
    bottomPercentNotifier.value = (percent / .3).clamp(0.0, 1.0);
  }

  void _isScrollingListener() {
    final percent = _controller.position.pixels / MediaQuery.of(context).size.height;
    if (!_controller.position. isScrollingNotifier.value && !isScrolling) {
      print('$percent percentpercentpercentpercent');
      if (percent < .3 && percent > .1) {
        print('percent < .3 && percent > .1');
        _controller.animateTo(widget.screenHeight * .2,
            duration: kThemeAnimationDuration, curve: Curves.decelerate);
        scroll();
      }
       if (percent < .1 && percent > 0) {
        print('(percent < .1 && percent > 0) ');
        _controller.animateTo(0,
            duration: kThemeAnimationDuration, curve: Curves.decelerate);
            scroll();
      }
     else if (percent < .5 && percent > .3) {
      print('(percent < .5 && percent > .3)');
        _controller.jumpTo(widget.screenHeight * .2,);
            // duration: kThemeAnimationDuration, curve: Curves.decelerate);
            scroll();
      }
      
    }
  }
  Future<void> scroll()async{
    isScrolling = true;
    await Future.delayed(kThemeAnimationDuration);
    isScrolling = false;
  }

  @override
  void initState() {
    _controller =
        ScrollController(initialScrollOffset: widget.screenHeight * .3);
    _controller.addListener(_scrollListener);
    bottomPercentNotifier = ValueNotifier(1.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.position.isScrollingNotifier
          .addListener(_isScrollingListener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  delegate: BuilderPersistentDelegate(
                    maxExtent: MediaQuery.of(context).size.height,
                    minExtent: 240,
                    builder: (percent) {
                      final bottomPercent = (percent / .3).clamp(0.0, 1.0);
                      final topPercent = ((1 - percent) / .7).clamp(0.0, 1.0);
                      return AnimatedDetailHeader(
                        place: widget.place,
                        topPercent: topPercent,
                        bottomPercent: bottomPercent,
                      );
                    },
                  )),
              SliverToBoxAdapter(
                child: TranslateAnimation(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black26,
                            ),
                            Flexible(
                              child: Text(
                                widget.place.locationDesc,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.place.description),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.place.description),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.place.description),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'PLACES IN THIS COLLECTION',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 150,
                    itemCount: TravelPlace.travelPlaces.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) {
                      final collectionPlace = TravelPlace.travelPlaces[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              collectionPlace.imagesUrl.first,
                              fit: BoxFit.cover,
                            )),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                ),
              )
            ],
          ),
          ValueListenableBuilder<double>(
            builder: (context, value, child) => Positioned.fill(
                top: null, bottom: -130 * (1 - value), child: child!),
            valueListenable: bottomPercentNotifier,
            child: Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white.withOpacity(0), Colors.white70])),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade800,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        for (var i = 0; i < 2; i++)
                          Align(
                            widthFactor: .7,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(TravelPlace
                                      .travelPlaces[i].user.urlPhoto),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Comments',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '120',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate(
      {required double maxExtent,
      required double minExtent,
      required this.builder})
      : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
