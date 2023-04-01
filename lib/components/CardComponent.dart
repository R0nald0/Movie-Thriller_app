import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/components/ImageComponent.dart';



class CardComponent extends StatelessWidget {

  String urlImg;
  String titulo;

  CardComponent({
    Key? key,
    required this.urlImg, required this.titulo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
            color: Colors.black45,
             borderOnForeground: true,
             shape: const RoundedRectangleBorder(
               borderRadius: BorderRadius.only(
                   bottomRight: Radius.circular(16),
               )
             ),
             child:Padding(
               padding: EdgeInsets.only(top: 10),
               child: Column(
                   children: [
                     ImageComponent(urlImg: urlImg ),
                     Padding(
                         padding: const EdgeInsets.symmetric(vertical: 9),
                         child: SizedBox(
                           width: 150,
                           child: Text(titulo,
                             overflow: TextOverflow.ellipsis,
                             textAlign:TextAlign.center,
                             style: const TextStyle(
                               color: Colors.white,
                               decoration: TextDecoration.underline,
                               decorationStyle: TextDecorationStyle.solid,
                               fontWeight: FontWeight.bold,
                               fontStyle: FontStyle.italic,
                               overflow: TextOverflow.fade,
                             ),
                           ),
                         )
                     )
                   ]
               ),
             ),

    );
  }
}
