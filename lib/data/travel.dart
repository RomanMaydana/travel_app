import 'dart:ui';

import 'package:flutter/material.dart';

enum StatusTag {
  popular('Popular places'),
  event('Event');

  const StatusTag(this.desc);
  final String desc;
}

class TypeUser {
  String name;
  String urlPhoto;

  TypeUser({required this.name, required this.urlPhoto});
}

class TravelPlace {
  String id;
  String name;
  int shared;
  int likes;
  String locationDesc;
  String description;
  List<String> imagesUrl;
  TypeUser user;
  StatusTag statusTag;

  TravelPlace({
    required this.id,
    required this.name,
    required this.shared,
    required this.likes,
    required this.locationDesc,
    required this.description,
    required this.imagesUrl,
    required this.user,
    required this.statusTag,
  });

  static List<TravelPlace> travelPlaces = [
  TravelPlace(
    id: 'tp001',
    name: 'Bali',
    shared: 15,
    likes: 130,
    locationDesc: 'Indonesia',
    description:
        'A picturesque island known for its beautiful beaches and vibrant culture.',
    imagesUrl: [
      'https://blog.centraldereservas.com/wp-content/uploads/2010/10/bali-1-1.jpg',
      'https://www.indonesiaentusmanos.com/media/cache/images/reportajes/Raja-Ampat-Viajes-Indonesia-en-tus-manos--1000_1000_A_0.jpg',
      'https://www.viajarabali.com/img/viajar-bali.jpg'
    ],
    user: TypeUser(name: 'Sarah', urlPhoto: 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_person_people_avatar_white_tone_icon_159365.png'),
    statusTag: StatusTag.popular,
  ),
  TravelPlace(
    id: 'tp002',
    name: 'Cape Town',
    shared: 8,
    likes: 85,
    locationDesc: 'South Africa',
    description:
        'A coastal city with beautiful beaches, stunning mountains, and diverse wildlife.',
    imagesUrl: [
      'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/199000/199384-St--James-Capetown.jpg',
      'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/199000/199371-St--James-Capetown.jpg',
      'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/199000/199377-St--James-Capetown.jpg'
    ],
    user: TypeUser(name: 'Alex', urlPhoto: 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_person_people_avatar_white_tone_icon_159365.png'),
    statusTag: StatusTag.event,
  ),
  TravelPlace(
    id: 'tp003',
    name: 'Santorini',
    shared: 20,
    likes: 190,
    locationDesc: 'Greece',
    description:
        'An idyllic island with white-washed buildings, blue-domed churches, and stunning sunsets.',
    imagesUrl: [
      'https://1.bp.blogspot.com/-q0DbRAqeIdA/WNOTQAl6oaI/AAAAAAAAnQs/L3yDI7Mzkds9-lu7O7Bj603Kh7kICUhFQCLcB/s400/Turismo%2Ben%2BSantorini%252C%2BGrecia.jpg',
      'https://amatetravel.com/wp-content/uploads/2020/06/santorini3-300x200.jpg',
    ],
    user: TypeUser(name: 'Emily', urlPhoto: 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_person_people_avatar_white_tone_icon_159365.png'),
    statusTag: StatusTag.popular,
  ),
  TravelPlace(
    id: 'tp004',
    name: 'Banff National Park',
    shared: 12,
    likes: 110,
    locationDesc: 'Canada',
    description:
        'A breathtakingly beautiful national park with turquoise lakes, snow-capped mountains, and abundant wildlife.',
    imagesUrl: [
      'https://mevoyacanada.org/wp-content/uploads/2020/11/viaje-en-coche-de-alquiler-al-parque-banff-e1605897465619.jpg',
      'https://mevoyacanada.org/wp-content/uploads/2020/11/lago-morain-en-banff-e1605897575576.jpg',
      'https://mevoyacanada.org/wp-content/uploads/2020/11/parque-nacional-banff-canada-e1605897628978.jpg'
    ],
    user: TypeUser(name: 'Jack', urlPhoto: 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_person_people_avatar_white_tone_icon_159365.png'),
    statusTag: StatusTag.event,
  ),
];
}

