import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:planet_app/appstring.dart';

import 'homepage.dart';

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
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> PlanetPage()));
          });
        },child: Icon(Icons.arrow_back_ios_new,color: Colors.white,))
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bg_stars.png')),
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
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30,width: 3),
                  borderRadius: BorderRadius.circular(15),),
                child: ModelViewer(
                  src: '${AppString.planets[widget.index]['file']}',
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                  disablePan: false,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
              padding: EdgeInsets.all(15),
                children: [
                  Text("LENGTH OF YEAR",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("${AppString.planets[widget.index]['year']}",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontWeight: FontWeight.normal),),SizedBox(height: 5,),
                  Text("PLANET TYPE",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("${AppString.planets[widget.index]['type']}",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontWeight: FontWeight.normal),),SizedBox(height: 5,),
                  Text("DISTANCE",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("${AppString.planets[widget.index]['radius']}",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontWeight: FontWeight.normal),),SizedBox(height: 5,),
                  Text("DETAILS",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("${AppString.planets[widget.index]['des']}",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontWeight: FontWeight.normal),),SizedBox(height: 5,),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
