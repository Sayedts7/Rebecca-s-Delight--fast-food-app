import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/contstants.dart';
import '../../constants/reusable.dart';
import '../items_pages/item_screen.dart';
import '../maps/search_map.dart';

class Category_donut extends StatefulWidget {
  const Category_donut({Key? key}) : super(key: key);

  @override
  State<Category_donut> createState() => _Category_donutState();
}

class _Category_donutState extends State<Category_donut> {
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
            decoration:  const BoxDecoration(
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
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/donut.png',
                      text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                      name: 'Choco Donut', price: '249', time: '15 minutes')));
                },
                child: Category_Container(
                    name: 'Choco Donut',
                    ratingC: '(102)',
                    price: '249',
                    image: 'images/biryaniwide.png',
                    rating: '4.7',
                    time: '15',
                    categ: ' Sweet',
                    off: 'Flat 15 % off'),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> item_screen(image: 'images/donut p.png',
                      text: 'Best burger in the town. Must try, Best burger in the town. Must try, Best burger in the town. Must try',
                      name: 'Pink Choco Donut', price: '300', time: '15 minutes')));
                },
                child: Category_Container(
                    name: 'Pink Donut',
                    ratingC: '(122)',
                    price: '300',
                    image: 'images/biryaniwide.png',
                    rating: '4.4',
                    time: ' 15',
                    categ: ' Sweets',
                    off: 'Flat 25 % off'),
              ),



            ],
          ),
        ));
  }
}
