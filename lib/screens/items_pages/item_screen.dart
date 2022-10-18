import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/contstants.dart';
import 'package:rebeca_delight/constants/reusable.dart';

class item_screen extends StatefulWidget {
  final String image, name, price,text, time;
  const item_screen({Key? key, required this.image, required this.text, required this.name, required this.price, required this.time}) : super(key: key);

  @override
  State<item_screen> createState() => _item_screenState();
}

class _item_screenState extends State<item_screen> {
   int count =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [Container(
            decoration: const BoxDecoration(
                color: Colors.black,

                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200)
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.white,
                  )
                ]
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,

          ),
          Image(
              height: 200,
              image: AssetImage(widget.image))],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [


              GradientIcon(Icons.star, 30, LinearGradient(
                colors: [appColor1,appColor2]
              ),
              ),

              GradientIcon(Icons.star, 30, LinearGradient(
                  colors: [appColor1,appColor2]
              ),
              ),

              GradientIcon(Icons.star, 30, LinearGradient(
                  colors: [appColor1,appColor2]
              ),
              ),

              GradientIcon(Icons.star, 30, LinearGradient(
                  colors: [appColor1,appColor2]
              ),
              ),

              GradientIcon(Icons.star_border, 30, LinearGradient(
                  colors: [appColor1,appColor2]
              ),
              ),

              Expanded(

                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Rs. ' +widget.price, style: txtstyll,)))
            ],
          ),
        ),
        
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Row(
            children: [
              Text(widget.name , style: txtstyllb,),

            ],
        ),
         ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Flexible(child: Text(widget.text , style: txtstyllc,))

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text('Delivery Time', style: txtstyll,),
              Expanded(child: Align(alignment: Alignment.centerRight,
              child: Text(widget.time, style: txtstyll,),)
              )
            ],
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: ()=> showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Add to cart'),
                  content: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {

                                setState(() {

                                });
                              },
                              child: GradientIcon(Icons.remove, 30, LinearGradient(
                                colors: [appColor1,appColor2]
                              )),
                            ),


                            Container(
                                height: 40,
                                width: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [appColor1,appColor2]),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Text(count.toString(), style: txtstyllb,))),


                            InkWell(
                              onTap: (){

                                setState(() {
                                  count++;
                                });
                              },

                              child: GradientIcon(Icons.add, 30, LinearGradient(
                                  colors: [appColor1,appColor2]
                              )),
                            )

                          ],
                      )),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'))
                  ],
                )),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [appColor1,appColor2]),
                borderRadius: BorderRadius.circular(10)
              ),
              child:  Center(child: Text('Add to cart', style: txtstyllb,)),
            ),
          ),
        )

      ],
    ),);
  }
}
