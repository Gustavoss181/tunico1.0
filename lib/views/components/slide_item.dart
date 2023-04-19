import 'package:bicjr_app/views/components/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     Container(
                       width:200,
                       height: 200,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(slideList[index].imageUrl),
                        fit: BoxFit.cover,
                        )
                       )
                     ),
                     SizedBox(height: 40,),
                     Text(slideList[index].title,textAlign:  TextAlign.center,style: TextStyle(fontSize:22, color: Colors.blue[900],fontWeight: FontWeight.bold,)),
                    SizedBox(height: 10,),
                     Text(slideList[index].description, textAlign: TextAlign.center ,),
                   ],
                 );
  }
}