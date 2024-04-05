 import 'package:flutter/material.dart';
class Roundbutton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;

  const Roundbutton({super.key,required this.title,
  required this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 50,


        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Center(child:Text(title ,style: TextStyle(color: Colors.yellowAccent ),)),
      ),
    );
  }
}


final ButtonStyle buttonPrimary=ElevatedButton.styleFrom(

  minimumSize: Size(327, 50),
  primary: Colors.blueAccent,

  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50))
  )
);