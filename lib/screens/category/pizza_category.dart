import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/reusable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/contstants.dart';
import '../items_pages/item_screen.dart';
import '../maps/search_map.dart';

class Pizaa_category extends StatefulWidget {
  const Pizaa_category({Key? key}) : super(key: key);

  @override
  State<Pizaa_category> createState() => _Pizaa_categoryState();
}

class _Pizaa_categoryState extends State<Pizaa_category> {
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

          title: Text(
            "Rebecca's Delight",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
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
          child: Column(
            children:  [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/pizza.png',
                      text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                      name: 'Chicken Pizza', price: '599', time: '40 minutes')));
                },
                child: Category_Container(
                    name: 'Chicken Pizza',
                    ratingC: '(102)',
                    price: '550',
                    image: 'images/pizzawide.png',
                    rating: '4.7',
                    time: '30',
                    categ: ' Pakistani',
                    off: 'Flat 20 % off'),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/Pizza2.png',
                      text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                      name: 'BBQ Pizza', price: '599', time: '40 minutes')));
                },
                child: const Category_Container(
                    name: 'BBQ Pizza',
                    ratingC: '(122)',
                    price: '350',
                    image: 'images/pizzawide.png',
                    rating: '4.4',
                    time: '30',
                    categ: ' Pakistani',
                    off: 'Flat 30 % off'),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/Pizza2.png',
                      text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                      name: 'BBQ Pizza', price: '599', time: '40 minutes')));
                },
                child: Category_Container(
                    name: 'Fajita Pizza',
                    ratingC: '(100)',
                    price: '650',
                    image: 'images/pizzawide.png',
                    rating: '4.6',
                    time: '40',
                    categ: ' Indian',
                    off: 'Flat 40 % off'),
              ),

            ],
          ),
        ));
  }
}



