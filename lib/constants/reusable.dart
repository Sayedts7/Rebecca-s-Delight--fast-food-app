import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/contstants.dart';

class Reusable_Con1 extends StatelessWidget {
  final String image, heading;
  const Reusable_Con1({Key? key, required this.image, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                    )
                  ]
                  ),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(image),
                  ),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200.withOpacity(0.1)
                          ),
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              height: 35,
                              color: Colors.black45,
                              child: Center(
                                child: Text(
                                  heading, style: txtstyllb,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]

              )),
        ],
      ),
    );
  }
}

class LargeContainer extends StatelessWidget {
  final String image, name, english, genre, price, rating;
  const LargeContainer(
      {Key? key,
      required this.image,
      required this.name,
      required this.english,
      required this.genre,
      required this.price,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 60,bottom: 15),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.34,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                )
              ]),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15,top: 60),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  Text(
                    name,
                    style: baratext,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Text('\$\$ ', style: txtstyllc,),
                        Icon(
                          Icons.fiber_manual_record,
                          size: 5,
                        ),
                        Text(genre, style: txtstyllc,)
                      ],
                    ),
                  ),
                  Flexible(
                      child: Text(
                          english, style: txtstyllc,)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text(price),
                        GradientIcon(
                            Icons.star,
                            20,
                            LinearGradient(
                              colors: [appColor1, appColor2],
                            )),
                        Text(rating)
                      ],
                    ),
                  )
                ]),
              ),
              Positioned(
                  top: -50,

                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(image),
                  ),
              )
            ],


          )

      ),
    );
  }
}

class wideContainer extends StatelessWidget {
  final String image, name, english, price, rating;
  IconData icon, icon2, icon3;
   wideContainer(
      {Key? key,
        required this.image,
        required this.name,
        required this.english,
        required this.price,
        required this.rating, required this.icon,required this.icon3, required this.icon2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0,  top: 15,bottom: 15),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.267,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                )
              ]),
          child: Stack(
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.none,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 5, bottom: 15,top: 15),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      name,
                      style: baratext,
                    ),
                  ),

                   Container(
                     child: Flexible(
                        child: Container(
                          child: Text(
                            english, style: TextStyle(fontSize: 18),),
                        )),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                    child: Row(
                      children: [
                       GradientIcon(icon, 25, LinearGradient(
                         colors: [appColor1,appColor2]
                       )),
                        GradientIcon(icon, 25, LinearGradient(
                            colors: [appColor1,appColor2]
                        )),
                        GradientIcon(icon, 25, LinearGradient(
                            colors: [appColor1,appColor2]
                        )),
                        GradientIcon(icon2, 25, LinearGradient(
                            colors: [appColor1,appColor2]
                        )),
                        GradientIcon(icon3, 25, LinearGradient(
                            colors: [appColor1,appColor2]
                        )),
                      ],
                    ),
                  ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right: 40),
                         child: Text(
                           price,
                           style: txtstyllc,
                         ),
                       ),

                       GradientIcon(Icons.shopping_cart, 25, LinearGradient(
                           colors: [appColor1,appColor2]
                       ))

                     ],
                   )
                ]),
              ),
              Positioned(
              left: -60,

                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:    AssetImage(image),
                )
              )
            ],


          )

      ),
    );
  }
}

class Category_Container extends StatelessWidget {
  final String name, price,rating, off,time,categ, image,ratingC;
  const Category_Container({Key? key, required this.name,required this.ratingC ,required this.price,required this.image, required this.rating, required this.time, required this.categ, required this.off}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.33,
decoration: BoxDecoration(
  color: Colors.black,
borderRadius: BorderRadius.circular(10)
),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [

                  Image(
                      width: double.infinity,

                      height: MediaQuery.of(context).size.height*0.19,
                      image: AssetImage(image)
                  ),
                  Positioned(
                      top: 10,
                      left: 0,
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [appColor1,appColor2]),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          width: 60,
                          height: 20,
                          child: Center(child: Text('Featured', style: txtstyllcat,)))),
                  Positioned(
                      top: 40,
                      left: 0,
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [appColor1,appColor2]),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          width: 75,
                          height: 20,
                          child: Center(child: Text(off, style: txtstyllcat,)))),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                          decoration: BoxDecoration(
                             shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          width: 30,
                          height: 30,
                          child: Center(child:
                          GradientIcon(
                            Icons.favorite_border,20,
                            LinearGradient(colors: [appColor1,appColor2])
                          )
                          )
                      )),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [appColor1,appColor2]),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          width: 65,
                          height: 20,
                          child: Center(child: Text(time +' minutes', style: txtstyllcat,)))),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: Row(
                children: [
                  Expanded(child: Text(name, style: txtstyll,)),
                  SizedBox(
                    width: 110,
                  ),

                  GradientIcon(
                      Icons.star,
                      20,
                      LinearGradient(
                        colors: [appColor1, appColor2],
                      )),
                  Text(rating),
                  SizedBox(
                    width: 5,
                  ),
                  Text(ratingC),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 5),
              child: Row(
                children: [
                  Text('\$\$\$ ', style: txtstyllc,),
                  GradientIcon(
                      Icons.fiber_manual_record,
                      5,
                      LinearGradient(
                        colors: [appColor1, appColor2],
                      )),
                  Text(categ, style: txtstyllc,),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
