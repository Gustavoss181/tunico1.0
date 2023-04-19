import 'package:flutter/material.dart';

class Slide{
   final String imageUrl;
   final String title;
   final String description;

   Slide({
     @required this.description, 
     @required this.imageUrl, 
     @required this.title
     });

}

final slideList = [
  Slide(
    imageUrl: 'assets/images/Teste1.jpg',
    title: 'Seja Bem-Vindo(a)!',
    description: 'lalalalalalalalala'
  ),
  Slide(
    imageUrl: 'assets/images/Teste1.jpg',
    title: 'Melhore suas práticas didáticas!',
    description: 'lalalalalalalalala'
  ),
  Slide(
    imageUrl: 'assets/images/Teste1.jpg',
    title: 'Compartilhe experiências e conhecimentos!',
    description: 'lalalalalalalalala'
  ),
];