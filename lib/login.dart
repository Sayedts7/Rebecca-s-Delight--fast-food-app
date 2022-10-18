import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/contstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: Color(0xff241e20),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Image(image: AssetImage('images/logo2.png'),),

                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 30.0),
                     child: Text("Rebecca's Delight", style: TextStyle(color:Colors.white, fontFamily: 'DancingScript', fontWeight: FontWeight.bold, fontSize: 40),),
                   ),

                  Expanded(
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black,fontSize: 20),
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.phone, color: appColor1,),
                                hintText: 'Email or phone number',
                                hintStyle: TextStyle(
                                    color: Colors.black54
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: appColor2, width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: appColor1, width: 3)
                                )

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black,fontSize: 20),
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.lock, color: appColor2,),
                                suffixIcon: Icon(Icons.remove_red_eye, color: appColor1,),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.black54
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: appColor1, width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: appColor2, width: 3)
                                )

                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text('Forgot Paasword?'),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                          child: GestureDetector(
                            onTap: () async{
                              SharedPreferences sp = await SharedPreferences.getInstance();
                              sp.setString('username', emailcontroller.text.toString());
                              sp.setString('password', passwordcontroller.text.toString());
                              sp.setBool('isLogin', true);


                              Navigator.pushNamed(context, '/home');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [appColor1, appColor2])
                              ),
                              child: Center(child: Text("Log In", style: TextStyle(fontSize: 25),)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0,right: 25,bottom: 50, top: 30),
                          child:   Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Don't Have an account?", style: txtstyllc,),
                              SizedBox(width: 5,),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, '/signup');
                                },
                                child: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [appColor1, appColor2]),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:  Center(child: Text('Sign Up', style: txtstyllc))),
                              ),

                            ],

                          ),
                        )

                      ],

                        )
                    ),


                  ),


                ],
              ),
            ),
          ),
        );
  }
}
