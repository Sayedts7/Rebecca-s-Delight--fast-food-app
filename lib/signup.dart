import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/contstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
   const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
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
                            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              controller: namecontroller,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(Icons.person, color: appColor1,),
                                  hintText: 'Name',
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
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: emailcontroller,
                              style: TextStyle(color: Colors.black, fontSize: 20),
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
                              style: TextStyle(color: Colors.black, fontSize: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),

                            child: GestureDetector(
                              onTap: () async{
                                SharedPreferences sp = await SharedPreferences.getInstance();
                                sp.setString('id', emailcontroller.text.toString());
                                sp.setString('pass', passwordcontroller.text.toString());
                                sp.setString('name', namecontroller.text.toString());
                                sp.setBool('isLogin', true);
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [appColor1, appColor2])
                                ),
                                child: Center(child: Text("Sign Up", style: TextStyle(fontSize: 25),)),
                              ),
                            ),
                          )  ],
                      )),

                ),



              ],
            ),
          ),
        ),
      );
  }
}
