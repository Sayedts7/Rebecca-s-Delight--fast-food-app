import 'package:flutter/material.dart';
import 'package:rebeca_delight/constants/reusable.dart';
import 'package:rebeca_delight/screens/items_pages/item_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/contstants.dart';
import '../maps/search_map.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
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
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => item_screen(
                              image: 'images/burger.png',
                              text:
                                  'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Zinger Burger',
                              price: '400',
                              time: '30 minutes')));
                },
                child: const Category_Container(
                    name: 'Zinger Burger',
                    ratingC: '(102)',
                    price: '450',
                    image: 'images/burgerwide.png',
                    rating: '4.7',
                    time: '30',
                    categ: ' Fast food',
                    off: 'Flat 20 % off'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => item_screen(
                              image: 'images/burger.png',
                              text:
                                  'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                              name: 'Chapli Burger',
                              price: '350',
                              time: '30 minutes')));
                },
                child: Category_Container(
                    name: 'Chapli Burger',
                    ratingC: '(122)',
                    price: '350',
                    image: 'images/burgerwide.png',
                    rating: '4.4',
                    time: '30',
                    categ: ' Fast food',
                    off: 'Flat 30 % off'),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/burger.png',
                      text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                      name: 'Zinger Burger', price: '400', time: '30 minutes')));
                },
                child: Category_Container(
                    name: 'Huge Burger',
                    ratingC: '(100)',
                    price: '650',
                    image: 'images/burgerwide.png',
                    rating: '4.6',
                    time: '40',
                    categ: ' Fast food',
                    off: 'Flat 40 % off'),
              ),
            ],
          ),
        ));
  }
}
