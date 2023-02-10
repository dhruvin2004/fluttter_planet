
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../appstring.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
        ),),
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
              ]
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text("GALAXY\nPLANTES",style: GoogleFonts.poppins(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1),),

                  ],
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      ...AppString.planets
                          .map(
                            (e) => SizedBox(
                          height: 400,
                          width: 250,
                          child: Stack(children: [
                            Positioned(
                              top: 60,
                              child: Container(
                                height: 300,
                                width: 250,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 50,),
                                    Text(e['name']),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 70,
                                width: 70,
                                alignment: Alignment.center,
                                decoration:  BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 6),
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('${e['img']}'))
                              ),
                            )
                            // SizedBox(
                            //   height: 150,
                            //   width: 150,
                            //   child: ModelViewer(
                            //     src: 'images/Mercury_1_4878.glb',
                            //     ar: true,
                            //     autoRotate: true,
                            //     cameraControls: true,
                            //     disablePan: false,
                            //   ),
                            // ),
                          ]),
                        ),
                      ).toList(),
                    ],
                    options: CarouselOptions(
                      height: 385.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(seconds: 5),
                      viewportFraction: 0.60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
