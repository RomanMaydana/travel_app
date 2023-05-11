import 'package:flutter/material.dart';

import '../../data/travel.dart';

class PlaceImagesPageView extends StatefulWidget {
  const PlaceImagesPageView({
    super.key,
    required this.place,
  });

  final TravelPlace place;

  @override
  State<PlaceImagesPageView> createState() => _PlaceImagesPageViewState();
}

class _PlaceImagesPageViewState extends State<PlaceImagesPageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.place.imagesUrl.length,
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: 0.9),
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (_, index) {
              final imageUrl = widget.place.imagesUrl[index];
              final isSelected = currentIndex == index;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin:  EdgeInsets.only(right: 10, top: isSelected? 5: 20, bottom: isSelected? 20: 5),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.black26, BlendMode.darken))),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.place.imagesUrl.length,
              (index) => Container(
                    color: Colors.black12,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 3,
                    width: 10,
                  )),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
