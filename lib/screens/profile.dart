import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/contstants.dart';
import 'package:rebeca_delight/constants/reusable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {

   Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'aamir';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SP();
  }

  SP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('username') ?? 'Syed Taimoor Shah';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
      colors: [appColor1, appColor2],
      ),
    ),
    ),
        title: Text('Profile',style: txtstyll,),),
      body: SafeArea(
        child: Padding( 
          padding: const EdgeInsets.only(left: 15.0,right: 15,top: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
              height: MediaQuery.of(context).size.height* 0.206,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                        blurRadius: 5,
                    )
                  ],
                 color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('images/dp.png'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: sadaFB,),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text('Sayedts00777@gmail.com', style: sadaF,),
                              )
                            ],
                          )
                        ],
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height* 0.04,
                      decoration: BoxDecoration(

                        gradient: LinearGradient(colors: [
                          appColor1,appColor2
                        ]),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                        Icon(Icons.info_outline),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Gold Member', style: sadaFB,),
                          SizedBox(
                            width: 90,
                          ),
                          Text('Upgrade',style: sadaFB,)
                        ],
                      ),
                    )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height* 0.14,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                )]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Account Balance', style: sadaFB,),
                          SizedBox(
                            width: 140,
                          ),
                          Text('\$ 50.00', style: sadaFB,),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [ Text('Refer Friend',style: sadaFB,),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Earn \$100',style: sadaFB,),],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.48,
                          ),
                          GradientIcon(Icons.arrow_forward_ios, 20, LinearGradient(colors: [appColor1,appColor2]))
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height* 0.37,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                      )]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GradientIcon(Icons.wallet, 20, LinearGradient(colors: [appColor1,appColor2])),
                          SizedBox(width: 10,),
                          Text('Add money to wallet', style: sadaFB,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.258
                          ),
                          GradientIcon(Icons.arrow_forward_ios, 20, LinearGradient(colors: [appColor1,appColor2]))
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          GradientIcon(Icons.credit_card, 20, LinearGradient(colors: [appColor1,appColor2])),
                          SizedBox(width: 10,),
                          Text('Payment settings', style: sadaFB,),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.305
                          ),
                          GradientIcon(Icons.arrow_forward_ios, 20, LinearGradient(colors: [appColor1,appColor2]))
                        ],
                      ),
                      SizedBox(height: 15,),

                      Row(
                        children: [
                          GradientIcon(Icons.security, 20, LinearGradient(colors: [appColor1,appColor2])),
                          SizedBox(width: 10,),
                          Text('Terms', style: sadaFB,),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.48
                          ),
                          GradientIcon(Icons.arrow_forward_ios, 20, LinearGradient(colors: [appColor1,appColor2]))
                        ],
                      ),
                      SizedBox(height: 15,),

                      Row(
                        children: [
                          Text('Connected Accounts', style: TextStyle(fontSize: 25, fontFamily: 'roboto'),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Icons.facebook, color: Colors.blue.shade500,),
                          SizedBox(width: 10,),
                          Text('Facebook', style: sadaFB,),
                          SizedBox(
                            width: 150,
                          ),
                          GradientIcon(Icons.cancel_outlined, 20, LinearGradient(colors: [appColor1,appColor2]))
                        ],
                      ),

                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Icons.language, color: Colors.blue.shade500,),
                          SizedBox(width: 10,),
                          Text('Google', style: sadaFB,),
                          SizedBox(
                            width: 150,
                          ),
                          Text('Connect', style: sadaFB,),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
