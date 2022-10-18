import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/contstants.dart';
import 'package:rebeca_delight/constants/reusable.dart';
import 'package:rebeca_delight/screens/maps/search_map.dart';
import 'package:rebeca_delight/screens/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'items_pages/item_screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
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

          title: const Text(
            "Rebecca's Delight",
            style: TextStyle(fontSize: 25),
          ),
          actions: const [
            Icon(Icons.notifications),
            SizedBox(
              width: 15,
            )
          ],
          // automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
              onDetailsPressed: (){
                Navigator.pushNamed(context, '/profile');
              },
                decoration: const BoxDecoration(
                  color: appColor1,
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('images/dp.png'),
                ),

                accountName: Text(
                  name.toString(),
                  style: txtstyll,
                ),
                accountEmail: null),
             ListTile(
              leading: const Icon(
                Icons.person,
                color: appColor2,
              ),
              title: const Text(
                'Profile',
                style: sadaF,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            Divider(
              color: appColor1,
            ),
            const ListTile(
              leading: Icon(
                Icons.receipt,
                color: appColor2,
              ),
              title: Text(
                'Orders',
                style: sadaF,
              ),
            ),
            const Divider(
              color: appColor1,
            ),
            ListTile(
              leading: const Icon(
                Icons.location_on,
                color: appColor2,
              ),
              title: Text(
                'Addresses',
                style: sadaF,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchMap()));
              },
            ),
            Divider(
              color: appColor1,
            ),
            const ListTile(
              leading: Icon(
                Icons.emoji_events,
                color: appColor2,
              ),
              title: Text(
                'Rewards',
                style: sadaF,
              ),
            ),
            Divider(
              color: appColor1,
            ),
            const ListTile(
              leading: Icon(
                Icons.help,
                color: appColor2,
              ),
              title: Text(
                'Help Center',
                style: sadaF,
              ),
            ),
            const Divider(
              color: appColor1,
            ),
             ListTile(
              title: Text(
                'Settings',
                style: sadaF,
              ),
              onTap: (){
             //   Navigator.push(context, MaterialPageRoute(builder: (context)=> test()));
              },
            ),
            ListTile(
              title: const Text(
                'Log out',
                style: sadaF,
              ),
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.pushReplacementNamed(context, '/signup');
              },
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: appColor2,
                            ),
                            hintText: 'What do you wanna eat?',
                            hintStyle: TextStyle(color: Colors.black54),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: appColor1, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: appColor2, width: 3))),
                      ),
                    ),
                    IconButton(onPressed: (){

                    }, icon: const Icon(Icons.tune, size: 40,)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Category',
                    style: baratext,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/cBurgers');
                        },
                        child: const Reusable_Con1(
                          image: 'images/burger.png',
                          heading: 'Burgers',
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/cBiryani');
                        },
                        child: const Reusable_Con1(
                          image: 'images/biryani.png',
                          heading: 'Rice',
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/cPizza');
                        },
                        child: const Reusable_Con1(
                          image: 'images/pizza.png',
                          heading: 'Pizza',
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/cDonut');
                        },
                        child: const Reusable_Con1(
                          image: 'images/donut.png',
                          heading: 'Dounuts',
                        ),
                      ),
                      const Reusable_Con1(
                        image: 'images/fried.png',
                        heading: 'Whatever',
                      ),
                      InkWell(
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                        },
                        child: const Reusable_Con1(
                          image: 'images/ice.png',
                          heading: 'Ice Cream',
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Text(
                    'Popular',
                    style: baratext,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:  [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/steek.png',
                              text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Steek', price: '1500', time: '35 minutes')));
                        },
                        child: LargeContainer(
                          image: 'images/steek.png',
                          name: 'Steek',
                          genre: 'Pakistani',
                          english:
                              'Bus kya bataon yar, aise biryani khai nahi hogi khabi ap na',
                          price: 'Rs. 1500    ',
                          rating: "4.7  (100+)",
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/Biryani.png',
                              text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Biryani', price: '300', time: '25 minutes')));
                        },
                        child: LargeContainer(
                          image: 'images/biryani.png',
                          name: 'Biryani',
                          genre: 'Pakistani',
                          english:
                              'Bus kya bataon yar, aise biryani khai nahi hogi khabi ap na',
                          price: 'Rs. 300    ',
                          rating: "4.5  (100+)",
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/frid.png',
                              text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Sada Rice', price: '100', time: '25 minutes')));
                        },
                        child: LargeContainer(
                          image: 'images/frid.png',
                          name: 'Sada Rice',
                          genre: 'Pakistani',
                          english:
                              'Bus kya bataon yar, aise biryani khai nahi hogi khabi ap na',
                          price: 'Rs. 100    ',
                          rating: "4.7  (100+)",
                        ),
                      ),


                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/fried.png',
                              text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Mixed', price: '400', time: '15 minutes')));
                        },
                        child: LargeContainer(
                          image: 'images/fried.png',
                          name: 'Mixed',
                          genre: 'Pakistani',
                          english:
                              'Bus kya bataon yar, aise biryani khai nahi hogi khabi ap na',
                          price: 'Rs. 400    ',
                          rating: "4.5  (100+)",
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/burger p.png',
                              text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Chapli Burger', price: '250', time: '35 minutes')));
                        },
                        child: LargeContainer(
                          image: 'images/burger.png',
                          name: 'Chapli Burger',
                          genre: 'Angrezi',
                          english:
                              ' Yara bus sa darta owaim kana, deer mazidar d, sta ba yaqeen na razi',
                          price: 'Rs. 250    ',
                          rating: '3.6  (100+)',
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/beef.png',
                              text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Beef Biryani', price: '500', time: '40 minutes')));
                        },
                        child: LargeContainer(
                          image: 'images/beef.png',
                          name: 'Beef Biryani',
                          genre: 'Pakistani',
                          english:
                              'Bus kya bataon yar, aise biryani khai nahi hogi khabi ap na',
                          price: 'Rs. 500    ',
                          rating: "4.2  (100+)",
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Extra Chezain",
                    style: baratext,
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/karahi r.png',
                            text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                            name: 'Chicken Karahi', price: '1100', time: '55 minutes')));
                      },
                      child: wideContainer(
                        image: 'images/karahi.jpg',
                        name: 'Chicken Karahi',
                        english:
                        'Bus kya bataon yar, aise karahi khai nahi hogi khabi ap na',
                        price: 'Rs. 1100    ',
                        rating: "4.2  (100+)",
                        icon: Icons.star,
                        icon2: Icons.star,
                        icon3: Icons.star_border,
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/chat r.png',
                            text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                            name: 'Channa Chat', price: '300', time: '15 minutes')));
                      },
                      child: wideContainer(
                        image: 'images/chat.jpg',
                        name: 'Channa Chat',
                        english:
                        'Bus kya bataon yar, aise chat khai nahi hogi khabi ap na',
                        price: 'Rs. 300    ',
                        rating: "3.0  (100+)",
                        icon: Icons.star,
                        icon2: Icons.star_border,
                        icon3: Icons.star_border,
                      ),
                    ),


                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/biryani r.png',
                            text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                            name: 'Chicken Biryani', price: '500', time: '30 minutes')));
                      },
                      child: wideContainer(
                        image: 'images/biryani2.jpg',
                        name: 'Chicken Biryani',
                        english:
                        'Bus kya bataon yar, aise Biryani khai nahi hogi khabi ap na',
                        price: 'Rs. 500   ',
                        rating: "5.0  (100+)",
                        icon: Icons.star,
                        icon2: Icons.star,
                        icon3: Icons.star,
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/kabab r.png',
                            text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                            name: 'Shami Kabab', price: '600', time: '10 minutes')));
                      },
                      child: wideContainer(
                        image: 'images/kabab.jpg',
                        name: 'Shami Kabab',
                        english:
                        'Bus kya bataon yar, aise kabab khai nahi hogi khabi ap na',
                        price: 'Rs. 600   ',
                        rating: "5.0  (100+)",
                        icon: Icons.star,
                        icon2: Icons.star,
                        icon3: Icons.star,
                      ),
                    ),


                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const item_screen(image: 'images/samosa r.png',
                            text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                            name: 'Samosa', price: '200', time: '15 minutes')));
                      },
                      child: wideContainer(
                        image: 'images/samosa.jpg',
                        name: 'Samosa',
                        english:
                        'Bus kya bataon yar, aise samosay khai nahi hogi khabi ap na',
                        price: 'Rs. 200   ',
                        rating: "4.0  (100+)",
                        icon: Icons.star,
                        icon2: Icons.star,
                        icon3: Icons.star_border,
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: GradientIcon(Icons.shopping_cart, 40,
              const LinearGradient(colors: [appColor1, appColor2])),
        ));
  }
}
