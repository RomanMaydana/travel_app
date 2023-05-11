import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/travel.dart';
import 'gradient_staus_tag.dart';
import 'place_image_page_view.dart';

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    super.key,
    required this.place,
    required this.topPercent,
    required this.bottomPercent,
  });

  final TravelPlace place;
  final double topPercent;
  final double bottomPercent;
  @override
  Widget build(BuildContext context) {
    print('$topPercent topPercent, bottomPercent $bottomPercent');
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: place.id,
          child: Material(
            child: ClipRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (20 + topPadding) * (1 - bottomPercent),
                      bottom: 160 * (1 - bottomPercent),
                    ),
                    child: Transform.scale(
                      scale: lerpDouble(1, 1.3, bottomPercent),
                      child: PlaceImagesPageView(place: place),
                    ),
                  ),
                  Positioned(
                      top: topPadding,
                      left: -60 * (1 - bottomPercent),
                      child: const BackButton(
                        color: Colors.white,
                      )),
                  Positioned(
                      top: topPadding,
                      right: -60 * (1 - bottomPercent),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ))),
                  Positioned(
                      top: lerpDouble(-30, 140, topPercent)!
                          .clamp(topPadding + 10, 140),
                      left: lerpDouble(60, 20, topPercent)!.clamp(20, 50),
                      right: 20,
                      child: Opacity(
                        opacity: bottomPercent < 1 ? 0 : 1,
                        child: Text(
                          place.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: lerpDouble(20, 40, topPercent),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Positioned(
                      top: 200,
                      left: 20,
                      child: AnimatedOpacity(
                        duration: kThemeAnimationDuration,
                        opacity: bottomPercent < 1 ? 0 : 1,
                        child: Opacity(
                          opacity: topPercent,
                          child: GradienStatusTag(statusTag: place.statusTag)),
                      ))
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
            top: null,
            bottom: -140 * (1-topPercent),
            child: TranslateAnimation(
                child: _LinkAndSharesContainer(place: place))),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 10,
          ),
        ),
        Positioned.fill(
            top: null,
            child: TranslateAnimation(child: _UnderInfoContainer(place: place)))
      ],
    );
  }
}

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 100 * value),
          child: child,
        );
      },
      child: child,
    );
  }
}

class _UnderInfoContainer extends StatelessWidget {
  const _UnderInfoContainer({
    super.key,
    required this.place,
  });

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(place.user.urlPhoto),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place.user.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Yesterday at 9:10 p.m.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text(
                '+Follow',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class _LinkAndSharesContainer extends StatelessWidget {
  const _LinkAndSharesContainer({
    super.key,
    required this.place,
  });

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black, shape: const StadiumBorder()),
              icon: const Icon(CupertinoIcons.heart, size: 26),
              label: Text(
                place.likes.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black, shape: const StadiumBorder()),
              icon: const Icon(
                CupertinoIcons.reply,
                size: 26,
              ),
              label: Text(
                place.shared.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          const Spacer(),
          TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                foregroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              icon: const Icon(
                Icons.check_circle_outline,
                size: 26,
              ),
              label: const Text(
                'Checkin',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
