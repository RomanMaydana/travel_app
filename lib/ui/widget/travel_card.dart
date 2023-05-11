import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/travel.dart';
import 'package:travel_app/ui/widget/gradient_staus_tag.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({super.key, required this.place, this.onPressed});
  final TravelPlace place;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(place.imagesUrl.first),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black26, BlendMode.darken))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(place.user.urlPhoto),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.user.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'Yesterday at 9:10 p.m.',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ))
              ],
            ),
            const Spacer(),
            Text(
              place.name,
              style: const TextStyle(
                  fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            GradienStatusTag(
              statusTag: place.statusTag,
            ),
            const Spacer(),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    icon: const Icon(CupertinoIcons.heart),
                    label: Text(place.likes.toString())),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    icon: const Icon(CupertinoIcons.reply),
                    label: Text(place.shared.toString()))
              ],
            )
          ],
        ),
      ),
    );
  }
}
