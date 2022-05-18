import 'package:flutter/material.dart';

class Author {
  String authorName;
  String quote;
  String imageUrl;
  String title;

  Author(
      {required this.authorName,
      required this.quote,
      required this.imageUrl,
      required this.title});
}

List<Author> authorList = [
  Author(
      authorName: 'Oprah',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"\Study Really Hard\"',
      imageUrl:
          'https://www.amacad.org/sites/default/files/person/headshots/oprah.jpg'),
  Author(
      authorName: 'Michelle Obama',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"You are not lonely"',
      imageUrl:
          'https://gato-docs.its.txstate.edu/jcr:688b1686-c389-4c24-92b9-569f39a48634/michelle-obama-book-efbe35b43e7973a1.jpeg'),
  Author(
      authorName: 'Jim Kwik ',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"You are unique"',
      imageUrl: 'https://www.famousbirthdays.com/rec/kwik-jim-rect.jpg'),
  Author(
      authorName: 'Nick Vujicic',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"Care Less"',
      imageUrl: 'https://i.ytimg.com/vi/1lrXTvOTncU/hqdefault.jpg'),
  Author(
      authorName: 'Nelson Mandela',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"Stop overthinking"',
      imageUrl:
          'https://www.ilo.org/wcmsp5/groups/public/---dgreports/---dcomm/documents/image/wcms_216736.jpg'),
  Author(
      authorName: 'Jay Shetty',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"You have got this"',
      imageUrl: 'https://m.media-amazon.com/images/I/A1tIJJog9DL._SX450_.jpg'),
  Author(
      authorName: 'Nelson Mandela',
      quote:
          'You are ready and able to do beautiful things in this world, and after you walk through those doors today, you will only ever have two choices: love or fear.',
      title: '"Stop overthinking"',
      imageUrl:
          'https://media.wired.com/photos/5bae7a3f6278de2d2123479b/master/pass/ElonMusk_18261092524731.jpg'),
];
