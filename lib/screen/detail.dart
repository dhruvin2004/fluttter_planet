import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:planet_app/appstring.dart';

class Details extends StatefulWidget {
  int index;


  Details({Key? key, required this.index}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppString.planets[widget.index]['name']}",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.black,
        leading: GestureDetector(onTap: (){
          setState(() {
            Navigator.pop(context);
          });
        },child: Icon(Icons.arrow_back_ios_new,color: Colors.white,))
      ),
      body: Container(
        decoration: const BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.blueAccent,
              ]),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child:
              ModelViewer(
                src: '${AppString.planets[widget.index]['file']}',
                ar: true,
                autoRotate: true,
                cameraControls: true,
                disablePan: false,
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
              padding: EdgeInsets.all(15),
                children: [
                  Text("Description",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("${AppString.planets[widget.index]['des']}",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontWeight: FontWeight.normal),)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
